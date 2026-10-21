+++
title = "Compiling Distributed System Models into Implementations with PGo"
+++

#### Ivan Beschastnikh, Renato Costa, Matthew Do, Finn Hackett
##### University of British Columbia, University of Waterloo

Distributed systems are difficult to design and implement correctly. In response, both research and industry are exploring applications of formal methods to distributed systems. For
example, Amazon has reported using TLA+ and PlusCal to verify its web services. A key challenge in this domain is the missing link between the formal design of a system and its implementation. Today, this link is bridged through manual and error-prone developer effort.

In this presentation we will first present a language called Modular PluCal (MPCal) that extends PlusCal by separating the model of the system from a model of the environment. We will then present a compiler toolchain called [PGo](https://github.com/UBC-NSS/pgo). PGo translates MPCal models to TLA+ for model checking, and also compiles MPCal models to executable Go code. In this way, system designers can use MPCal to model and verify their distributed system designs, and can then use PGo to extract working implementations of these designs.
