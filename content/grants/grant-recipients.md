+++
menuPre = "<i class='fa-fw fas fa-scroll'></i> "
title = 'TLA+ Foundation Grant Recipients'
linkTitle = 'Grant Recipients'
description = "The TLA+ Foundation is pleased to announce the projects that have been funded by the TLA+ Foundation Grant Program. Grant recipients are selected based on their potential to advance TLA+ technology and benefit the broader community."
date = 2026-03-02T00:00:00-07:00
draft = false
weight = 50
+++

TLA+ Foundation is pleased to announce that the following projects have been funded by the TLA+ Foundation Grant Program.

## 2025

### TLAPS Proof Decomposition in VSCode

**Lead:** Karolis Petrauskas  
**Grant:** $12,800

In this project, a tool for proof decomposition has been implemented. It works by proposing user actions (refactorings) applicable at the current step to split a proof step into simpler ones, thus guiding a user through the proving process while decisions are mechanical. The tool is implemented as a part of the Language Server for the TLAPS and provides suggestions as LSP Code Actions. The TLAPS language server is currently integrated with the VSCode editor. Still, the proof decomposition actions are implemented in an editor-agnostic manner. They can also be incorporated into other editors.

The majority of the decomposition suggestions are based on the introduction and elimination rules of propositional logic. Their application accounts for a significant fraction of the proof's steps and is often quite mechanical. Nevertheless, the user is still responsible for deciding which actions to choose, in what order, which facts to expand, and, of course, the overall strategy of the proof. The tool also suggests definitions to expand in the current proof obligation and to introduce subproofs.

The next step is to integrate the proof decomposition actions into the proof obligation view, thereby making the tool more visible to the user. This requires a VSCode-specific implementation. Also, more proof decomposition suggestions can be implemented in this framework by reusing existing building blocks.

## 2024

### PlusCal Extensions, Unicode Adoption, and SANY Improvements

**Lead:** Andrew Helwer  
**Grant:** $93,000

This project focuses on TLA⁺ parsing infrastructure, with the overall goal of unifying development resources toward a single parser: SANY, the Syntactic ANalYzer, implemented in the core Java-based TLA⁺ tools. The largest work item is to change the TLA⁺ Proof System (TLAPS) parser to use SANY instead of its existing OCaml-based parser. This goal required preliminary work developing large implementation-independent test corpora for TLA⁺ parsing, including standardized error codes. That work unlocked additional SANY functionality such as incremental parsing of expressions. The project also includes documentation work: a developer onboarding tutorial was created on how to write a TLA⁺ parser & interpreter from scratch, covering the unique challenges of working within the language. Further documentation work will cover how to consume SANY's parse tree for the development of novel TLA⁺ applications.

### Fully Compositional Inductive Invariant Inference in TLA+

**Leads:** Ian Dardik and Eunsuk Kang  
**Grant:** $42,000

A key advantage to formal methods, such as TLA+, is the ability to *verify* that a specification is correct with respect to its desired properties. While the TLC model checker can show correctness for finite instances of a specification, it is often necessary to find an *inductive invariant* to prove that the specification is correct for all possible instances.

Inductive invariants are logical formulas that are notoriously complex and hard to create manually. As a result, the problem of automated *inductive invariant inference* is an active research topic. Despite recent progress in this area, complex specifications, such as Raft, currently remain out of reach for the state-of-the-art invariant inference tools.

This TLA Foundation-funded research project proposed *fully compositional* inductive invariant inference with the goal of extending invariant inference to complex, real-world specifications. The main innovation is the first divide-and-conquer framework for invariant inference. The framework verifies a TLA+ specification in the following four steps: (1) Decomposition: decompose the specification into smaller components, (2) Contract Creation: create an *assume-guarantee contract* for each component, (3) Local Inference: infer a *local inductive invariant* to prove each component’s contract, and (4) Global Correctness: by construction, the conjunction of all local invariants is an inductive invariant *for the entire system*.

The project team built an algorithm for synthesizing assume-guarantee contracts for TLA+ components, implemented in a research prototype tool called [Carini](https://github.com/cmu-soda/carini), which is publicly available for use by the TLA+ community.

The project team completed several case studies that use the fully compositional invariant inference framework to verify TLA+ specifications. Most encouragingly, they used the framework to semi-automatically verify a specification of Raft used at MongoDB. The project team views these results as a call for future research into compositional inductive invariant inference.

