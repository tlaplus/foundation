+++
title = "Alloy for TLA+ Users"
+++

#### Jay Parlar
##### Okta

Alloy (http://alloytools.org/) is a modelling language for software systems, out of MIT. Like TLA+, it comes bundled with an IDE and a model checker. Its mathematical foundation is also based on sets and predicate logic. Where Alloy differs from TLA+ is in its "visualizer", its use of SAT solvers, and its focus on modelling relational data instead of concurrent systems. This talk provides a high level overview of Alloy for a typical TLA+ user, and show instances where one might choose Alloy over TLA+, and vice-versa, and more importantly, why it's hugely valuable to know both systems.

One-page Summary of Content:

* Introduction
* Show simple Alloy spec
* Describe Alloy syntax
  * Compare key syntax to equivalent TLA+ syntax
* Show visualizer
* Show the main visualizer mode
* Show the table-based visualizer mode
  * Show the visualizer theme editor
* Show invariant checks
* Show multiple "run" statements
* Describe relational data underpinnings of Alloy
  * Everything is sets and relations
  * Show the JOIN operator
  * Show transitive closure operator
* Describe building out a model from scratch
  * Illustrate how the visualizer often points out areas a human might not think of
  * Like TLA+, Alloy is a tool to help you think better
* Show how time is modelled in Alloy
* Show how to do TLA+-style operations
* Show enabling conditions
* Show "UNCHANGED" equivalent
* Show what a time-based counterexample looks like in Alloy
* Talk about advantages of using Alloy to model other peoples' systems
* Talk about when one might use Alloy or might use TLA+
* Talk about what TLA+ could learn from Alloy
* Talk about what Alloy could learn from TLA+
  * UNCHANGED, for example
