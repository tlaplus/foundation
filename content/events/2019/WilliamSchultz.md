+++
title = "Fixing a MongoDB Replication Protocol Bug with TLA+"
+++

#### William Schultz
##### MongoDB

The MongoDB database replication protocol is heavily influenced by the Raft consensus algorithm, but it
makes several design choices that diverge from Raft for the sake of performance and integration with
the rest of the MongoDB database. Verifying the correctness of these design choices can be non-trivial.
One subtle area of the protocol has to do with how operation log entries are determined to be durable
after they are replicated to a set of nodes. The system must know when it can consider a log entry
“committed”, which means it will never be rolled back in the future. MongoDB recently used TLA+ and
the TLC model checker to expose and fix a series of related bugs in this area of its replication protocol.

In 2016, a safety bug in MongoDB's replication protocol was discovered that allowed nodes to
incorrectly mark log entries as committed. After implementing a fix, a liveness bug with the solution was
found in 2018 that prevented nodes from being able to commit log entries in certain cases, even if it was
safe to do so. To address this problem, we implemented a further modification to the protocol, but, in
early 2019, yet another liveness problem was discovered, which allowed for the formation of "sync
source" cycles in the replica set spanning tree. Nodes involved in such a cycle could be stuck indefinitely,
unable to replicate any new log entries. To solve this problem, a new solution was proposed that would
allow replica set nodes to learn of commit points more freely, from any other node in the replica set, as
opposed to only learning commit points from the node they had currently chosen as their "sync source".
This solution appeared to satisfy all the necessary requirements, but there was another liveness bug
discovered that could, again, prevent nodes from committing log entries in some cases. The final
solution that we settled on merged ideas from the various fixes we had tried along the way. This also led
us to an additional, surprising realization, which was that the fix for the first bug encountered in 2016
did not satisfy the safety requirements we thought it had. In 3 node replica sets, the solution was
correct, but in 5 node replica sets, it was not. This led us to address this issue on old versions of
MongoDB, fixing a safety bug that had gone unnoticed for well over 2 years.

When we started to discover this series of bugs in 2018 and 2019, we began using TLA+ to model our
replication system and check the correctness of our protocol, in addition to demonstrating the problems
with earlier proposed fixes. We soon realized that TLA+ and the model checker allowed us to expose
bugs and verify design changes with a precision and efficiency that was not previously possible. TLC
found many of the bugs described above in just a few minutes, if not seconds. For example, the state
space of the model used to reproduce the bug discovered in 2016 was only around 50,000 states, and
was explored exhaustively by TLC in under a minute on a laptop.

In this presentation, we will present the specification we wrote, which is less than 350 lines of TLA+, and
discuss the series of bugs and fixes and how the model checker helped us find errors. We expect that
using TLA+ from the beginning would have allowed us to prevent the complex series of bugs spanning
multiple years. If we had modeled the system upfront and specified its safety and liveness requirements
precisely, we would have been able to root out subtle design issues early on and verify the solutions
quickly. We plan on making TLA+ a more significant part of our development process and applying it to
other non-trivial design questions that come up throughout our system.

The presentation will be accessible to anyone familiar with Raft or other distributed algorithms.
Audience members who are not familiar with formal verification will learn the power of TLA+, and those
who are experienced with formal verification will appreciate hearing about our experience applying it in
industry.
