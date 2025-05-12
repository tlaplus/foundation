+++
type = "blog"
title = 'May 2025 Monthly Development Update'
date = 2025-05-15
+++

This is the TLA⁺ Foundation monthly development update ([subscribe via RSS](/blog/index.xml)).
Here we summarize the past month of development for the benefit of Foundation patrons and interested members of the community.
We will also highlight a good bug or small feature for prospective new contributors to look at!
If your TLA⁺ contribution was missed, worry not - we publish monthly, so it's easy to hop on the next train; open an issue [here](https://github.com/tlaplus/foundation/issues).

If you're interested in getting involved in the TLA⁺ community:
- Learn TLA⁺ starting [here](https://lamport.azurewebsites.net/tla/learning.html)!
- Join the monthly virtual community meetings [here](https://groups.google.com/g/tlaplus/c/3CloQYEH0qQ/m/GAIxbKNgBAAJ)!
- Read the mailing list [here](https://groups.google.com/g/tlaplus)!
- Start hacking on the tools themselves [here](https://github.com/tlaplus/tlaplus)!

### Organizational Updates

- The [2025 TLA⁺ Community Event](https://conf.tlapl.us/2025-etaps/) was held alongside [ETAPS 2025](https://etaps.org/2025/) in Hamilton, Ontario, Canada on May 4th, 2025.
  We had a good slate of talks, and the recordings have now been posted.
  Thanks to the organizers [Igor Konnov](https://konnov.phd/), [Markus Kuppe](https://github.com/lemmy/), [Murat Demirbas](https://cse.buffalo.edu/~demirbas/), and [Stephan Merz](https://members.loria.fr/SMerz/index.html) for putting on a great conference!
- The TLA⁺ Foundation, in collaboration with NVIDIA, is holding a [GenAI-Accelerated TLA⁺ Challenge](https://foundation.tlapl.us/challenge/)!
  This is an open call for submissions exploring the intersection of TLA⁺ and generative AI.
  Entries must be submitted by July 3rd, 2025 and will be judged by the TLA⁺ Specification Language Committee.
  First place wins a NVIDIA RTX 5090 GPU!
- The TLA⁺ Foundation grant program is continuing on a rolling basis; please [submit a proposal](/grants/2024-grant-program/) if you have ideas to improve TLA⁺ so the Foundation can support you financially as you work on them.
  You can find some desired projects listed [here](https://github.com/tlaplus/tlaplus/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22TLA%2B%20Foundation%20Funding%22).
  If you're trying to figure out the next stage of your career and like the sound of being paid a stipend to work on free & open source software in the formal methods space, this is a great opportunity!

### Posts & Papers

- [Heidi Howard](http://www.heidihoward.co.uk/) was at NSDI '25 to present [*Smart Casual Verification of the Confidential Consortium Framework*](https://www.usenix.org/conference/nsdi25/presentation/howard), reporting the experience of binding a formal TLA⁺ specification to a C++ implementation.
- [Derek Egolf](https://www.egolf.io/) was at ETAPS 2025 to present [*Accelerating Protocol Synthesis and Detecting Unrealizability with Interpretation Reduction*](https://link.springer.com/chapter/10.1007/978-3-031-90653-4_8), on his work to automatically synthesize a TLA⁺ specification satisfying a temporal property.
- [Hillel Wayne](https://www.hillelwayne.com/) wrote [a post](https://buttondown.com/hillelwayne/archive/requirements-change-until-they-dont/) on why specifying your system with formal methods makes sense even though system requirements are apt to change.
- [Igor Konnov](https://konnov.phd) wrote [a post](https://protocols-made-fun.com/modelchecking/2025/04/08/value.html) on the value of formal specification & model checking when designing & analyzing protocols.
- [Murat Demirbas](https://cse.buffalo.edu/~demirbas/) wrote [a blog post](https://muratbuffalo.blogspot.com/2025/05/modular-verification-of-mongodb.html) version of his talk at the TLA⁺ community event, on using TLA⁺ to specify cross-shard transactions in MongoDB.
 He also wrote a post [summarizing other talks](https://muratbuffalo.blogspot.com/2025/05/notes-from-tla-community-event.html) from the event.
- [A. Jesse Jiryu Davis](https://emptysqua.re/blog/about/) wrote [a blog post](https://emptysqua.re/blog/are-we-serious-about-statistical-properties-tlaplus/) version of his TLA⁺ community event talk, on the possibility of adding statistical & performance modeling capabilities to TLA⁺.
  He also posted [his notes](https://emptysqua.re/blog/2025-tlaplus-community-event/) about other talks at the event.
- [Andrew Helwer](https://ahelwer.ca) also [wrote a blog post](https://ahelwer.ca/post/2025-05-15-tla-dev-status/) version of his TLA⁺ community event talk, on the current state of TLA⁺ development and why now is a good time to get into developing TLA⁺ language tooling.

### Community TLA⁺ Tooling Updates

Work done by community members on non-TLA⁺ Foundation-managed projects:
- [Igor Konnov](https://konnov.phd/) added some additional inductive invariant [test cases](https://github.com/apalache-mc/apalache/commit/14c11be5dad94154f6216fed2c387390aa105c29) to the Apalache symbolic model checker.
- [Federico Ponzi](https://fponzi.me/) updated tlaplus-formatter [to reflect an upstream SANY API change](https://github.com/FedericoPonzi/tlaplus-formatter/pull/10) and debugged some issues with handling of TLAPS modules.
- [Hillel Wayne](https://www.hillelwayne.com/) added some more exercises ([1](https://github.com/hwayne/tlaplus-exercises/commit/bb4b407302633510bd7fb12430e473a14f4b8cd3), [2](https://github.com/hwayne/tlaplus-exercises/commit/93dbe922a1ecf26f2801c3ef968dcf668d786322)) building his series intended to help people learn TLA⁺.
- [William Schultz](https://will62794.github.io/) worked on his web-based [spectacle TLA⁺ interpreter](https://github.com/will62794/spectacle), fixing [a bug](https://github.com/will62794/spectacle/commit/4e087252530a8937408828744b5f257f062dfe59) with universal quantifier expressions that modify state variables and making numerous UI tweaks.
  He also made many changes to [Scimitar](https://github.com/will62794/scimitar), an inductive invariant synthesis tool for TLA⁺.

### Core TLA⁺ Tooling Updates

Work done by community members on TLA⁺ Foundation-managed projects:
- [Calvin Loncaric](https://calvin.loncaric.us/) worked on compiling the Java-based TLA⁺ tools into a [Graal native image](https://www.graalvm.org/latest/reference-manual/native-image/) to reduce startup time; for this he [removed use of an unsupported library](https://github.com/tlaplus/tlaplus/commit/0613f42b961d41bfeb41d8ef6ee8e9762859ea94) and [added a target to the build](https://github.com/tlaplus/tlaplus/commit/789535d93e64c1c960d265947ae37d50ff805c17).
  He also worked on usability, submitting [a PR to TLC](https://github.com/tlaplus/tlaplus/pull/1180) to display values of any ∀-bound names when an invariant is violated.
  Finally, he submitted [a PR for the TLC interpreter](https://github.com/tlaplus/tlaplus/pull/1178) simplifying the `isEmpty()` method on set datatypes.
- [Karolis Petrauskas](https://github.com/kape1395) worked on the [TLAPM-based](https://github.com/tlaplus/tlapm) TLA⁺ language server, changing [TLAPM's info output stream](https://github.com/tlaplus/tlapm/pull/209), adding support for [proof step renumbering](https://github.com/tlaplus/tlapm/pull/210), and further refining the [proof step renaming](https://github.com/tlaplus/tlapm/pull/211) feature.
  He also improved the language server's integration with the TLA⁺ VS Code Extension ([1](https://github.com/tlaplus/vscode-tlaplus/pull/375), [2](https://github.com/tlaplus/vscode-tlaplus/pull/376)).
- Longtime TLA⁺ tools maintainer [Markus Kuppe](https://github.com/lemmy/) had quite an active month, adding [company-level execution statistics to TLC](https://github.com/tlaplus/tlaplus/issues/1170), multiple user-friendly warnings ([1](https://github.com/tlaplus/tlaplus/pull/1173), [2](https://github.com/tlaplus/tlaplus/pull/1174), [3](https://github.com/tlaplus/tlaplus/pull/1185)), improved error messages when [TLC encounters non-enumerable values](https://github.com/tlaplus/tlaplus/pull/1179), and variable inclusion in [TLC coverage statistics](https://github.com/tlaplus/tlaplus/pull/1183).
  He also began writing [a new tool documentation set](https://github.com/tlaplus/tlaplus/pull/1181).
  For the TLA⁺ VS Code Extension, he updated it to [incorporate level checking information from SANY](https://github.com/tlaplus/vscode-tlaplus/pull/367) and [exposed some APIs](https://github.com/tlaplus/vscode-tlaplus/pull/372) to be used by LLM agents.

### TLA⁺ Foundation-Funded Updates

Finally, things [Andrew Helwer](https://ahelwer.ca/) (author of this post) worked on - all funded by the TLA⁺ Foundation!
- I spent a lot of time expanding the [*Create your own TLA⁺ tools*](https://docs.tlapl.us/creating:start) tutorial series, trying to encode as much knowledge about parsing TLA⁺ as possible.
  As a highlight, the tutorial now has a module on parsing vertically-aligned conjunction & disjunction lists.
  The tutorial as a whole is nearly complete; I've finished writing the code for two of the final three modules (operator parameters, actions, then safety checking) and now need to write them up.
- I created & delivered [a talk](https://www.youtube.com/watch?v=KrhZebeRn90) at the TLA⁺ Community Event summarizing the current state of TLA⁺ development, what the TLA⁺ Foundation has been funding to improve it, and what I want to see in the near future.
  I also summarized the talk [in a blog post](https://ahelwer.ca/post/2025-05-15-tla-dev-status/).

In the next month I am hoping to focus on becoming more familiar with the TLAPM parser interface before transitioning it to use SANY.

### Newbie Corner

Here we highlight an issue that would be a good choice for new contributors!
Before starting work, be sure to read the [contribution guidelines](https://github.com/tlaplus/tlaplus/blob/master/CONTRIBUTING.md) and discuss your planned approach with maintainers.

This is probably one of the most advanced issues yet profiled in this series, but it's very interesting.
William Schultz [reported a bug](https://github.com/tlaplus/tlaplus/issues/220) where TLA⁺ cannot handle constraints like `<<y>>' = <<y>>`, which should be a synonym for `UNCHANGED y` and `y' = y`.

Why is this bug interesting?
When evaluating an action, TLC has to do a weird double-duty where it both evaluates the action as a simple logical predicate over variables - evaluating to true or false - while also extracting hints about the possible values of those same variables!
Consider what happens when TLC sees an action like:
```
Action ==
  /\ x = 0
  /\ x' = x + 1
```
When it evaluates the expression `x' = x + 1`, it *doesn't yet know the value of `x'`*!
It has to slyly recognize that the as-yet-undefined value of `x'` is on the left hand side of an equals operator, so can be assigned/constrained to the value `x + 1`; then, having defined the value of `x'`, it evaluates `x' = x + 1` as an ordinary expression which will of course be true.

Wrapping your head around this weird double-duty of TLC's interpreter will bring you great understanding of TLA⁺ tool internals.
In TLA⁺, it isn't only variables that can be primed - entire expressions can be primed.
When that happens, it is the same as individually priming all the variables within that expression.
So, `<<y>>'` is the same as `<<y'>>`.

There are two plausible approaches to fixing this issue.
First, you could look at how TLC evaluates the equals operator at runtime when both parameters are tuples, and more specifically when the left-hand-side is primed.
Second, you could consider the approach of statically de-sugaring expressions like `<<x, y, z>>' = <<e1, e2, e3>>` into `x' = e1 /\ y' = e2 /\ z' = e3` in the parser, so the transformation cost is only paid once instead of every time the expression is evaluated.

It will be a challenge to fix this issue, but you will come out the other side with a very solid grasp of the tools and what sort of TLA⁺ specs are possible to model check.

Issues highlighted in past months have also yet to be claimed!
 - April 2025: [PlusCal translates to invalid TLA⁺ if procedure identifier is too long](blog/2025-04-dev-update/#newbie-corner)
 - March 2025: [interpret expressions of the form `x' ⊆ S`](blog/2025-03-dev-update/#newbie-corner)
 - February 2025: [interpret expressions of the form `CHOOSE x : x ∈ S`](blog/2025-02-dev-update/#newbie-corner)
 - December 2024: [add parser support for backticks in strings](blog/2024-12-dev-update/#newbie-corner)

