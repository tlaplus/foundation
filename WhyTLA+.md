# Why Support TLA+

### What TLA+ Does

One of the costliest elements of software development — second only to finding out what to build — is ensuring the system does what it is meant to do. That is why developers spend much of their time on quality assurance through code reviews, testing (functional, performance, security), and a great deal of bug-fixing. Some bugs are costlier than others because:

- They are difficult to reproduce during the development phase (**discovery**).
- They are *design* flaws that require significant rework to fix (**correction**).
- They cause significant damage, such as downtime, data loss, or security vulnerabilities (**impact**).

Because they are non-deterministic and complex, concurrent and distributed systems, tend to suffer from bugs that are costly for all those reasons.

TLA+ is a specification language and a set of tools that offer a cost-effective way of finding and fixing flaws early in development when those flaws are cheaper to fix. Users write a precise and concise description of the system and their expectations from its behavior in TLA+, and the tools then check whether the expectations hold and, if not, how they might break.

### Why TLA+

TLA+ is particularly attractive for industry use compared to other formal methods. Its unique strengths in specifying concurrent and distributed systems make it applicable precisely where mainstream software needs help the most. It can specify arbitrary properties of systems of arbitrary complexity and "ordinary" developers can still learn it in a few weeks. Automated verification with a model checker makes the cost of verification low enough to compare favorably with traditional assurance methods.

For those reasons, TLA+ is among the most popular formal methods in industry, employed successfully by Amazon, Oracle, Microsoft, ElasticSearch, MongoDB, and others. This [technical report from Amazon](http://lamport.azurewebsites.net/tla/amazon-excerpt.html) relates how engineers learned TLA+ in just a few week. They then found and fixed potentially catastrophic and hard-to-reproduce problems in several AWS services.

### Where TLA+ Has Been and Where It's Going

Turing Award-winner Leslie Lamport invented TLA+ in the '90s as the culmination of decades of research in concurrent and distributed systems. It has gained a measure of popularity in the industry since the 2010s, as distributed systems started growing in size and use, and it's become clear that traditional quality assurance methods fail to catch some of the costliest bugs.

As Lamport is nearing retirement from Microsoft Research, he wishes to entrust TLA+ to a foundation to ensure TLA+'s relevance and growth are supported by donations of funds and personnel. The foundation will also invest in promising avenues to make TLA+ easier to use or more powerful, such as tools that monitor if a production system deviates from its specification at runtime. Another avenue are tools that could generate tests from the specifications.
