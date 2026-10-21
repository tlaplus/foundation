+++
title = "Proving Properties of a Minimal Covering Algorithm"
+++

#### Ioannis Filippidis, Richard M. Murray
#### Control and Dynamical Systems, California Institute of Technology

This work concerns the specification and proof using TLA+ of properties of an algorithm for solving the minimal covering problem, which we have implemented in Python. Minimal covering is the problem of choosing a minimal number of elements from a given set to cover all the elements from another given set, as defined by a given function. The TLA+ modules are available [online](https://github.com/johnyf/omega/tree/master/spec/mincover). The proofs of safety properties in these modules have been checked with the proof assistant TLAPS (version 1.4.3), in the presence of the tools Zenon, CVC4, Isabelle, and LS4. We have been motivated to study and implement this algorithm for converting binary decision diagrams to formulas of small size, so that humans can read the results of symbolic computation.
