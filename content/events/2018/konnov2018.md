+++
title = "BMCMT: Bounded Model Checking of TLA+ Specifications with SMT"
+++

#### Igor Konnov, Jure Kukovec, Thanh Hai Tran

We present the development version of BMCMT—a symbolic model checker for TLA+. It finds, whether a TLA+ specification satisfies an invariant candidate by checking satisfiability of an SMT formula that encodes: (1) an execution of bounded length, and (2) preservation of the invariant candidate in every state of the execution. Our tool is still in the experimental phase, due to a number of challenges posed by TLA+ semantics to SMT solvers. We will discuss these challenges and our current approach to them in the talk. Our preliminary experiments show that BMCMT scales better than the standard TLA+ model checker TLC for large parameter values, e.g., when a TLA+ specification models a system of 10 processes, though TLC is more efficient for tiny parameters, e.g., when the system has 3 processes.

We believe that early feedback from the TLA+ community will help us to focus on the most important language features and improve our tool.
