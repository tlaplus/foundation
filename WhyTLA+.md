# Why Support TLA+

### What TLA+ Does

One of the costliest elements of software development — second only to figuring out what to build — is ensuring the system does what it's meant to. As a formal methods researcher once said, computers were invented to surprise us; if we knew what answer they'd give us, we wouldn't have built them. That is why much of the development process is spent on quality assurance through code reviews, testing (functional, performance, security) and a great deal of bug-fixing. Some bugs are costlier than others because:

- They're not easily reproduced during the development phase (**discovery**).
- They are *design* flaws that require significant rework to fix (**correction**).
- They cause significant damage, such as downtime, data loss, or security vulnerabilities (**impact**).

Because they're non-deterministic and complex, concurrent and distributed systems tend to suffer from bugs that are costly for all those reasons.

TLA+ is a specification language and a set of associated tools that offer a cost-effective way of finding and fixing the most expensive flaws early in development. Users write a precise and concise description of the system and their expectations from its behaviour in TLA+, and the tools then check whether the expectations hold and, if not, how they might break.

### Why TLA+

TLA+ is particularly attractive for industry use compared to other formal methods. Its unique strengths in specifying concurrent and distributed systems make it applicable precisely where mainstream software needs the most help. It can specify arbitrary properties of systems of arbitrary complexity, and still be learned by "ordinary" developers in a few short weeks. Automated verification with a model checker makes the cost of verification low enough to compare favourably with traditional assurance methods.

For those reasons, while formal methods are not expected to become mainstream in the near future, TLA+ is the most popular one in industry, employed successfully by Amazon, Oracle, Microsoft, ElasticSearch, MongoDB and others. This [technical report from Amazon](http://lamport.azurewebsites.net/tla/amazon-excerpt.html) relates how, in just a few short weeks, engineers learned TLA+ and then found and fixed potentially catastrophic and hard-to-reproduce problems in several AWS services.

### Where TLA+ Has Been and Where It's Going

Turing Award-winner Leslie Lamport invented TLA+ in the '90s as the culmination of decades of research into the analsysis of concurrent and distributed systems. It has gained a measure of popularity in industry since the 2010s, as distributed systems started growing in size and use and it's become clear that traditional quality assurance methods fail to catch some of the costliest bugs.

As he's nearing retirement from Microsoft Research, Lamport wishes to entrust TLA+ to a foundation that will work to ensure TLA+'s maintenance, relevance, and growth supported by donations of funds and personnel. The foundation will also invest in promising avenues to make TLA+ easier to use or more powerful, such tools that can monitor a production system as it runs, immediately warning about any deviation from the specification, and tools that could generate tests from the specifications.