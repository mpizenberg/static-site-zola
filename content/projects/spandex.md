+++
title = "SpanDeX"
date = 2019-09-27
template = "project-item.html"

[extra]
authors = ["Thomas Forgione", "Matthieu Le Boucher", "Matthieu Pizenberg"]
teaser = "An attempt to make a modern alternative to LaTeX"
thumbnail = "spandex_128.png"
# header = "spandex_header.png"
links = [
    {name = "Book", url = "https://rust-spandex.github.io/"},
    {name = "Code", url = "https://github.com/rust-spandex/spandex"},
    {name = "Crate", url = "https://crates.io/crates/spandex"},
]
+++

### TL;DR

SpanDeX is an attempt at a better LaTeX.
It aims to build beautiful documents fast,
with great error messages when compilation fails.

### Motivation

It started with the following observations:

- LaTeX has many advantages:
  - LaTeX produces magnficient PDFs
  - LaTeX displays beautiful mathematic formulas
  - LaTeX has a really nice justification algorithm
  - LaTeX is widely used, especially in science
- but it also have major problems
  - LaTeX compilation is extremely verbose
  - Debugging LaTeX code is really painful
  - LaTeX packages and dependencies are a mess

After experiencing languages with great error messages such as Rust or Elm,
going back to other languages such as LaTeX is really painful
and frustrating due to the lack of alternatives.
Few open source typesetting systems exist such as
[Patoline][patoline] (not very mature) and [Sile][sile],
but it will be more fun to make one of our own in Rust.
There exists already some Rust crates to generate pdf documents,
such as [pdf-canvas][pdf-canvas] and [printpdf][printpdf] that we are using.

[patoline]: http://patoline.org/
[sile]: http://sile-typesetter.org/
[pdf-canvas]: https://crates.io/crates/pdf-canvas
[printpdf]: https://crates.io/crates/printpdf

### Language

Of course, if we want to rewrite LaTeX, we need a language.
For now, we chose to make a markdown-like language,
and maybe in the future, extend it with template-style syntax.
Currently, a typical SpanDeX source code looks like follows.

```txt
# Hello world

Lorem ipsum dolor sit amet, *consectetur* adipisicing elit,
sed do eiusmod tempor incididunt ut /labore et dolore magna
aliqua/. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.
/*Duis aute irure dolor*/ in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur.
*Excepteur sint occaecat* cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, *consectetur* adipisicing elit.


## Hello again

Lorem ipsum dolor sit amet, *consectetur* adipisicing elit,
sed do eiusmod tempor incididunt ut /labore et dolore magna
aliqua/. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.
```

And is rendered as follows.

![](spandex.png)

### Try it

All the instructions are available on the [homepage][homepage].
Briefly, you need to:

- install rust (`curl -sSf https://sh.rustup.rs | sh`)
- install spandex (`cargo install spandex`)
- initialize a project (`spandex init example`)
- go to the generated example (`cd example`)
- build the pdf (`spandex build`)

The output will be saved to `output.pdf`.
You can play with the `main.dex` file and re-run `spandex build`.

[homepage]: https://rust-spandex.github.io/

### Long term future

Some basic features will need to be supported such as
includes, lists, code blocks, maths and images.
Here are some features that we would also like to have on the long term:

- vector graphics like TikZ, or ability to include SVG
- ability to write plugins in Rust / WebAssembly
- parallel compilation
- incremental compilation
- online editor using
