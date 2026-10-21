+++
title = "S-expressions for Actions with Logic Temporal"
+++

#### David McNeil
##### Viasat

This talk will present the [SALT tool](https://github.com/Viasat/salt) which provides "S-expressions for Actions with Logic Temporal". Specifically, SALT was designed and built with the goal of providing a one-to-one mapping from Clojure syntax to TLA+ syntax. This work was born out of practical experience in creating TLA+ models of communication protocols in the satellite communication industry. Software developers working on TLA+ in this domain learned to deeply appreciate the mathematical precision and conciseness of the TLA+ syntax as well as the capabilities of the TLA+ Toolbox for validating models. The SALT tool was built as an attempt to improve the process of writing TLA+ specifications primarily by providing the following:

 * an interactive, read-eval-print loop (REPL) to provide rapid feedback to specification authors

 * a natural means of writing unit tests around individual TLA+ operators as they are written

 * auto-formatting to avoid the need to manually fiddle with formatting as specifications are modified

These goals are accomplished via SALT which allows TLA+ specifications to be written as Clojure s-expressions. Clojure is a dialect of Lisp that runs on the Java Virtual Machine and other virtual machines. In SALT, s-expressions are valid Clojure statements which are evaluated to produce TLA+ code.

Clojure editors such as Emacs allow the SALT specifications to be manipulated in a very fluid fashion through tools such as paredit. SALT uses the fact that the s-expressions are puns which have the TLA+ semantics when transpiled to TLA+ but also having semantics as "plain old Clojure". Of course, the Clojure semantics are not ultimately the same as the TLA+ semantics but when testing individual operators there is a natural bottom-up development path that allows the Clojure semantics to be tested first and then the TLA+ semantics to be used.

Specifically the specification operator are first built as s-expressions in the context of a REPL providing rapid feedback regarding compilation and execution errors. Automated unit test suites can be built around the operators in Clojure. This development approach is very natural for developers and leads to increased confidence in using TLA+. Once the author has confidence in the SALT specification it can be evaluated to produce a well formatted TLA+ specification. By the time a TLA+ specification is run in the TLA+ Toolbox the author has confidence that syntactically and logically the individual operators are correct. The outstanding question is whether the overall model behaves as expected, which is what the TLA+ Toolbox can assess.

In practice, this tool has proven to be effective not just in speeding the development time of writing specifications, but also in providing a path for specification authors to confidently build specifications incrementally. This benefits are realized in a manner which does not obscure the TLA+ concepts.
