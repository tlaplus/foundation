+++
title = "Exposing Design Flaws in Shared-Clock Systems with TLA+"
+++

#### Russell Mull
##### Auxon

Many cyber-physical systems (e.g. Industrial Automation systems, Medical
Devices, and Autonomous Vehicles) are designed with the presumption of a
reliable shared clock. This is a very risky approach. Shared clocks can drift or
even fail, leading to catastrophic results. I will present an approach to
modeling shared-clock systems with TLA+ that can expose clock-based failure
modes and drift envelopes, allowing the system designer to better understand the
system's failure boundaries. I will also share strategies to constrain the
search space, and general experiences from the use of TLA+ for this class of
problem.
