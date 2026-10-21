+++
title = "Towards verifying algorithms for model-based engineering with TLA+"
+++

## Abstract

Systems engineering increasingly relies on modeling as the complexity of systems increases. Thales, for example, released in open source the Capella environment dedicated to Model-Based Systems Engineering. Plenty of modeling environments such as that one are built upon elaborate open-source technologies that rely on one core technology, EMF (Eclipse Modeling Framework) which became a de facto standard many years ago.
 
EMF defines primitive operations for model manipulation according to the modeling languages in use, which themselves conform to a core framework, Ecore. The concepts proposed by Ecore are of a rather high level of abstraction, making common model manipulations simple and convenient. A consequence of that sophistication, however, is that advanced manipulation algorithms that have to guarantee structural or semantic properties can be tricky to design (e.g., diff and merge, incremental transformations, reuse or synchronization mechanisms, ...). Still, many such algorithms are essential to perform modeling at large scale and their expected properties critical to the effectiveness of model-based engineering workflows.
 
Consequently, we sought to formalize aspects of EMF that have an influence on the design of such algorithms in a way that makes it possible to verify the algorithms. To that aim, we used TLA+ and its associated tools: the Toolbox, TLC and TLAPS. We present our progress at this stage and our feedback about learning and using TLA+ in this industrial context.
