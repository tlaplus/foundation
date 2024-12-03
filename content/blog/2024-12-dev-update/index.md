+++
title = "December 2024 Monthly Development Update"
type = "blog"
date = 2024-12-01
+++

Hello!
You're reading the inaugural edition of the TLA⁺ Foundation monthly development update.
Here I'll summarize the past month of development for the benefit of Foundation patrons and interested members of the community.
These posts are authored by [Andrew Helwer](https://ahelwer.ca/) and while I'll focus a fair bit on my own work (as a way of providing a monthly status update to the Foundation, really), I will also provide a rundown of other happenings in the community!
If I missed your contribution or there was some important part of it I didn't capture in the summary, worry not!
These newsletters will be published monthly so it's easy to hop on the next train; try opening an issue [here](https://github.com/tlaplus/foundation/issues).

If you're interested in getting involved in the TLA⁺ community:
- Learn TLA⁺ starting [here](https://lamport.azurewebsites.net/tla/learning.html)!
- Read the mailing list [here](https://groups.google.com/g/tlaplus)!
- Join the monthly virtual community meetings [here](https://groups.google.com/g/tlaplus/c/CpAEnrf-DHQ/m/YrORpIfSBwAJ)!
- Start hacking on the tools themselves [here](https://github.com/tlaplus/tlaplus)!

Let's start with some interesting non-coding-related developments & announcements:
- [Leslie Lamport](https://lamport.azurewebsites.net/) published a new book, titled *A Science of Concurrent Programs*!
  It's [freely available for download](https://lamport.azurewebsites.net/tla/science-book.html) but a physical edition is in the works.
  I've been reading & enjoying it and asking lots of questions on the mailing list.
  It's very much focused on the "TLA" part of TLA⁺ (meaning the Temporal Logic of Actions) so it's a good read if you want to go really in-depth on the logical theory underpinning the TLA⁺ language.
- The [TLA⁺ Community Event 2025](https://conf.tlapl.us/2025-etaps/) was announced, to be co-located with [ETAPS 2025](https://etaps.org/2025/) in Hamilton, Ontario, Canada on May 4th, 2025.
  We hope to see you there!
  The talk proposal submission deadline is February 7th, 2025.
- East of the Atlantic, [ABZ 2025](https://abz-conf.org/site/2025/) - the 11th International Conference on Rigorous State-Based Methods - will take place from June 10th to 13th of 2025 in Düsseldorf, Germany.
  TLA⁺-related papers are welcome; the deadline for submitting abstracts is February 3rd, 2025.
- [Jack Vanlighty](https://jack-vanlightly.com) wrote [a blog post](https://jack-vanlightly.com/blog/2024/11/19/obtaining-statistical-properties-through-modeling-and-simulation) on using TLA⁺ to obtain statistical properties of distributed system designs.
- [Lorin Hochstein](http://lorinhochstein.org/) has been on a TLA⁺ blogging *tear*, publishing three excellent blog posts in quick succession: [*Specifying serializability in TLA⁺*](https://surfingcomplexity.blog/2024/10/28/serializability-and-tla/), [*Multi-version concurrency control in TLA⁺*](https://surfingcomplexity.blog/2024/10/31/multi-version-concurrency-control-in-tla/), and [*Extending MVCC to be serializable, in TLA⁺*](https://surfingcomplexity.blog/2024/11/03/extending-mvcc-to-be-serializable-in-tla/).
  The first post is especially effective as an introduction to using refinement to express whole-system safety properties that just can't be done with single-state formulas.
- At the November virtual community meeting, [Feng Wenhan](https://github.com/fwhdzh) presented his work using the TLC state graph export function to drive model-based testing; some shortfalls in the state graph export functionality led to the proposal of designing a [robust state graph export format](https://github.com/tlaplus/tlaplus/issues/1073).
- Also at the November virtual community meeting, Leslie Lamport announced his retirement at the end of the year at the age of 83.
  A well-earned rest, although his contributions will be missed!

Now on to coding-related community developments:
- [Federico Ponzi](https://fponzi.me/) is prototyping a [TLA⁺ Formatter](https://github.com/FedericoPonzi/tlaplus-formatter), including hammering down the [default settings](https://github.com/FedericoPonzi/tlaplus-formatter/pull/6).
  If you have opinions on how TLA⁺ should look, now is a great time to weigh in!
- [Julia Ferraioli](https://www.juliaferraioli.com/) updated the TLA⁺ Foundation website with blogging capabilities, facilitating the very post you are reading right now! She chose the Hugo static site generator, of which I am also a fan.
- [William Schultz](https://will62794.github.io/) released [Scimitar](https://github.com/will62794/scimitar), a tool for verifying the safety of distributed protocols based on the technique of inductive proof decomposition in TLA⁺.
- [Hillel Wayne](https://www.hillelwayne.com/) has started contributing to the TLA⁺ VS Code plugin, adding some nice [diagnostic messages for PlusCal](https://github.com/tlaplus/vscode-tlaplus/pull/350).
- [Ioannis Filippidis](https://github.com/johnyf) landed some long-awaited changes [adding support for bound tuple quantification](https://github.com/tlaplus/tlapm/pull/140) to the TLA⁺ Proof Manager (TLAPM), reviewed by [Damien Doligez](http://cambium.inria.fr/~doligez/).
  This enables TLAPM to parse quantification expressions that use tuple destructuring, like `∀ ⟨x, y⟩ ∈ ℕ × ℕ : x + y ∈ ℕ`.
- We welcomed [Mathieu Borderé](https://github.com/MathieuBordere) as a new contributor as he landed [his first PR](https://github.com/tlaplus/tlaplus/pull/1067) in the TLA⁺ tools, improving command line help output for the parser!
- Longtime TLA⁺ Tools maintainer [Markus Kuppe](https://github.com/lemmy) submitted many changes, focused on the TLA⁺ debugger ([1](https://github.com/tlaplus/tlaplus/issues/1052), [2](https://github.com/tlaplus/tlaplus/pull/1062)), miscellaneous bugfixes ([1](https://github.com/tlaplus/tlaplus/pull/825), [2](https://github.com/tlaplus/tlaplus/pull/1063), [3](https://github.com/tlaplus/tlaplus/pull/1066), [4](https://github.com/tlaplus/tlaplus/pull/1071), [5](https://github.com/tlaplus/tlaplus/pull/1078), [6](https://github.com/tlaplus/tlaplus/pull/1080), [7](https://github.com/tlaplus/tlaplus/pull/1086), [8](https://github.com/tlaplus/tlaplus/pull/1087)), and some design-level work on shortening & choosing counterexample traces ([1](https://github.com/tlaplus/tlaplus/issues/1084), [2](https://github.com/tlaplus/tlaplus/issues/400)).
- [Finn Hackett](https://github.com/fhackett) found [an issue with TLC](https://github.com/tlaplus/tlaplus/issues/1076) where reading non-ASCII strings from disk causes a crash; [a fix](https://github.com/tlaplus/tlaplus/pull/1079) is pending review.

Finally, things I worked on over the past month-and-a-half - all funded by the TLA⁺ Foundation:
- I adapted [the TLA⁺ syntax test corpus](https://github.com/tlaplus/tlaplus-standard/tree/main/tests/tlaplus_syntax) for use on TLAPM, which implements its own TLA⁺ parser in OCaml.
  These found [a number of issues](https://github.com/tlaplus/tlapm/pull/159) in the parser, and also resulted in me writing around fifty additional syntax tests which were backported to [the TLA⁺ Java-based tools](https://github.com/tlaplus/tlaplus/pull/1050) and [the tree-sitter-tlaplus grammar](https://github.com/tlaplus-community/tree-sitter-tlaplus/pull/131).
- I investigated transitioning TLAPM's parser to use SANY, the Java-based TLA⁺ tools' parser.
  SANY has [an XML parse tree exporter](https://github.com/tlaplus/tlaplus/blob/master/tlatools/org.lamport.tlatools/src/tla2sany/xml/XMLExporter.java) which would avoid any FFI weirdness between OCaml and Java code.
  I submitted some fixes ([1](https://github.com/tlaplus/tlaplus/pull/1054), [2](https://github.com/tlaplus/tlaplus/pull/1057), [3](https://github.com/tlaplus/tlaplus/pull/1058)) to dust off the XML exporter and wrote [a prototype consumer](https://github.com/ahelwer/tlapm/blob/003f409442bc1fdf6622513ff63ad1fe16e78c97/test/sany/parse_sany_xml_output.ml) in OCaml for the XML output.
  After poking at the prospect of translating SANY's parse tree output to TLAPM's internal parse tree format for a couple of weeks, I'm thinking the project has a fairly high risk of dragging on without any intermediate milestones to lock in value.
  It remains to be seen whether the TLA⁺ Foundation will commit to it.
  I think there are some work possibilities that could smooth the way, for example by developing a large corpus of tests for SANY's semantic- and level-checkers to build familiarity with their workings.
- I played at stepping into the TLAPM maintainer role, just making changes to the development infrastructure like [fixing a flaky CI build](https://github.com/tlaplus/tlapm/pull/179), adding [developer documentation](https://github.com/tlaplus/tlapm/pull/178), hunting for [ways to cut down the release size](https://github.com/tlaplus/tlapm/issues/181), and - most substantially - [setting up rolling pre-releases for TLAPM](https://github.com/tlaplus/tlapm/pull/182)!
  TLAPM hasn't seen an official numbered release for a couple of years now, so most people seem to build it from source to get the latest changes; this work just makes the built artifacts from the head of the main branch easily available for download.
- I submitted a few one-off bugfixes and enhancements for the Java-based TLA⁺ tools: some [tests and fixes for the level-checker](https://github.com/tlaplus/tlaplus/pull/1068), and the [removal of a now-unused error logging path in the parser](https://github.com/tlaplus/tlaplus/pull/1069).
- I wrote up a proposal for additional TLA⁺ standardization that has been rolling around my head for a bit, on [standardizing human-readable error codes](https://github.com/tlaplus/rfcs/issues/15) similar to Rust and C# and many other languages.
  I think the benefits would be wonderful, especially with regard to stimulating test coverage off the happy path.

## Newbie Corner

Quite a bit of stuff going on in TLA⁺ development!
Don't be intimidated though, there is plenty of room and desire for newcomers.
Join the mailing list and monthly community meeting to introduce yourself if you'd like to join in!

Here I will highlight one issue each month that I think would be good for new contributors.
This month it's [the inability of the TLA⁺ parser to handle backticks in strings](https://github.com/tlaplus/tlaplus/issues/802).
The primary reason this is a good first issue is that the required change seems very localized and tremendously unlikely to introduce any bugs; the second reason is that it's in a very well-tested part of the codebase (the syntax parser), which has the [standard TLA⁺ syntax test corpus](https://github.com/tlaplus/tlaplus-standard/tree/main/tests/tlaplus_syntax) levied against it - a corpus you will contribute to as part of the fix!
I hope to see somebody pick this up in December!
