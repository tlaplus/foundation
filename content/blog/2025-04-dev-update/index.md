+++
type = "blog"
title = 'April 2025 Monthly Development Update'
date = 2025-04-15
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

### Organization & user updates

- The program for the [TLA⁺ Community Event 2025](https://conf.tlapl.us/2025-etaps/) has now been announced!
  It will be co-located with [ETAPS 2025](https://etaps.org/2025/) in Hamilton, Ontario, Canada on May 4th, 2025.
  Hope to see you there!
- The TLA⁺ Foundation grant program is continuing on a rolling basis; please [submit a proposal](/grants/2024-grant-program/) if you have ideas to improve TLA⁺ so the Foundation can support you financially as you work on them.
- TLA⁺ Foundation patron Amazon has appointed a new representative to the TLA⁺ Foundation board!
  [Ankush Desai](https://ankushdesai.github.io/) is a Principal Applied Scientist at AWS and one of the original developers of the [P formal specification language](https://p-org.github.io/P/).
  He recently co-authored a paper on [formal methods use in AWS](https://dl.acm.org/doi/10.1145/3712057) and [delivered a talk on the same topic](https://www.linkedin.com/posts/antithesis-operations_bugbash-activity-7313942545464467456-jJf3).
  TLA⁺ is sure to benefit from his advice and experience!

### Community TLA⁺ tooling updates

Work done by community members on non-TLA⁺ Foundation-managed projects:
- [Dom Dwyer](https://github.com/domodwyer) worked extensively on his new Rust-based [TLA⁺ formatter tool](https://github.com/domodwyer/tlafmt).
- [William Schultz](https://will62794.github.io/) worked on his web-based [spectacle TLA⁺ interpreter](https://github.com/will62794/spectacle), adding an animated Raft example and making many tweaks to the UI.
- [Ioannis Filippidis](https://github.com/johnyf) released a new [TLA⁺ syntax parser](https://pypi.org/project/tla/), written in Python.
  The source code can be obtained by downloading & extracting the package file.
- [Hillel Wayne](https://www.hillelwayne.com/) began development of [a set of exercises](https://github.com/hwayne/tlaplus-exercises) to help people learn TLA⁺.
  The exercises are all designed with the aim of automatically verifying attempted solutions.

### Core TLA⁺ tooling updates

Work done by community members on TLA⁺ Foundation-managed projects:
- [Karolis Petrauskas](https://github.com/kape1395) added another feature to the [TLAPM-based](https://github.com/tlaplus/tlapm) TLA⁺ language server, [supporting renaming proof steps](https://github.com/tlaplus/tlapm/pull/208).
- First-time contributor [Krishna Padmasola](https://github.com/kpadmasola) added validation for the [`-labelRoot` PlusCal command-line parameter](https://github.com/tlaplus/tlaplus/pull/1164), fixing a bug featured in the January 2025 edition of this newsletter.
- Another first-time contributor [Bruno Felipe Francisco](https://poorlydefinedbehaviour.github.io/) fixed a longstanding bug in the TLA⁺ VS Code extension, adding support for [identifying parameterized constants](https://github.com/tlaplus/vscode-tlaplus/pull/366) as possible symbols for autocompletion and other operations.
- [Federico Ponzi](https://fponzi.me/) worked on the TLA⁺ VS Code extension, [linking directly to error locations in the code](https://github.com/tlaplus/vscode-tlaplus/pull/363) when possible and tweaking the counterexample UI ([1](https://github.com/tlaplus/vscode-tlaplus/pull/365), [2](https://github.com/tlaplus/vscode-tlaplus/pull/354)).

### TLA⁺ Foundation-funded updates

Finally, things [Andrew Helwer](https://ahelwer.ca/) (author of this post) worked on - all funded by the TLA⁺ Foundation!
- After spending the past few months doing a lot of testing & exploration of the various TLA⁺ parsers, I am writing a guide to distill this knowledge for others.
  The tutorial series [*Create your own TLA⁺ tools*](https://docs.tlapl.us/creating:start) will teach you how to write TLA⁺ language tooling for a minimal vertical slice of the language (just enough to handle the generalized Die Hard spec, with some inconvenience).
  The purpose of the guide is to prepare contributors to make serious contributions to the existing TLA⁺ language tools, by writing their own simple prototype and then contrasting it with the existing implementations.
- I [attempted](https://github.com/tlaplus/tlaplus/issues/880#issuecomment-2744440311) (unsuccessfully) to get the Eclipse-based TLA⁺ Toolbox GUI to build using the [TLA⁺ tools Maven package](https://oss.sonatype.org/content/repositories/snapshots/org/lamport/tla2tools/), so we can split the Toolbox out into its own repository.
  If you're reading this and know anything about the OSGi build process, your help would be greatly appreciated!
- I combined some repos and collected TLA⁺ standards documents into the [RFCs repo](https://github.com/tlaplus/rfcs), to be used as a one-stop shop for the TLA⁺ language standard, conformance test suites, and RFC status tracking.

### Newbie Corner

Here we highlight an issue that would be a good choice for new contributors!
Before starting work, be sure to read the [contribution guidelines](https://github.com/tlaplus/tlaplus/blob/master/CONTRIBUTING.md) and discuss your planned approach with maintainers.

This time we're looking at PlusCal, a language which transpiles into TLA⁺.
The transpilation process includes logic to insert linebreaks so the output TLA⁺ is readable.
Unfortunately, in one case this logic has gone awry and results in [invalid TLA⁺ output on long procedure names](https://github.com/tlaplus/tlaplus/issues/370)!

There is an [old PR](https://github.com/tlaplus/tlaplus/pull/634) (not merged for some reason or another) which might contain the simple fix necessary.
So, the work required is to evaluate the PR change to see whether it indeed fixes the issue, then find a way to write an automated test for it.
Try various modifications of the reported failing test case to ensure that close input variants don't elude your fix.
Resubmit the combined changes in your own PR with credit to the original, using the `Co-authored-by:` git commit message trailer.

Issues highlighted in past months have also yet to be claimed!
 - March 2025: [interpret expressions of the form `x' ⊆ S`](blog/2025-03-dev-update/#newbie-corner)
 - February 2025: [interpret expressions of the form `CHOOSE x : x ∈ S`](blog/2025-02-dev-update/#newbie-corner)
 - December 2024: [add parser support for backticks in strings](blog/2024-12-dev-update/#newbie-corner)

The following past highlighted issues have now been fixed:
 - Highlighted January 2025, fixed April 2025: [Krishna Padmasola](https://github.com/kpadmasola) completed [fix the PlusCal CLI `-labelRoot` option](blog/2025-01-dev-update/#newbie-corner)

