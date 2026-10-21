+++
title = "Semantic highlighting in TLA+"
+++

#### Andrew Helwer

Syntax highlighting uses text color and formatting to communicate useful information to users of a formal language; this is generally accomplished with regular expressions identifying keywords, literals, and common functions. There has been a recent trend toward using more powerful grammars that fully parse languages and expose complex semantic information in highlighting. This talk details the recent development of such a grammar for TLA+ using tree-sitter, an error-tolerant incremental parser generator. Possibilities for semantic information exposure are explored, ranging from conjunction/disjunction list scopes to differentiating identifiers into variables, constants, and operators - and beyond! The talk also explores the possibility of using the grammar as a permissive error-tolerant "first pass" parser in a TLA+ language server, or as the basis for other tools. The talk ends with a futuristic demo writing a TLA+ spec where the text is translated into its corresponding unicode math symbols in real time.
