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

SpanDeX is an attempt to rewrite LaTeX. It aims at having a simple language, clear and precise error messages, beautiful error message, and producing document as beautiful as LaTeX's.

### History

SpanDeX is an attempt to rewrite LaTeX. It started with the following observations:

- LaTeX has many advantages:
  - LaTeX produces magnficient PDFs
  - LaTeX displays beautiful mathematic formulas
  - LaTeX has a really nice justification algorithm
  - LaTeX is widely used, particularly in the science field
- but it also have major problems
  - LaTeX language is very verbose and cumbersome
  - LaTeX command line program is really verbose
  - Debugging LaTeX is really painful
  - LaTeX is a really heavy program with many packages

After spending much time writing code in Rust, with its safety and nice error messages, it's more and more painful going back to other languages, including LaTeX, even if the frustration from having any non-LaTeX quality document is enough to force me to use LaTeX.

So I started searching alternatives, and I found a few that produce beautiful output

- [Patoline][patoline]
- [Sile][sile]

[patoline]: http://patoline.org/
[sile]: http://sile-typesetter.org/

but they are quite young and don't really fit my needs.

And, (as always), I thought to myself: "Why don't I rewrite this?"

So I started to look at some Rust crates to generate PDFs,
and I also found a few ([pdf-canvas][pdf-canvas] and [printpdf][printpdf]) and I gave printpdf a try.
I started writing simple sentences at the very top of an A4 page,
then I introduced automatic line breaking,
then I added some margins to the document and I finally wrote a naive justifier,
that writes text on a line until it requires a line break,
and fairly shares the remaining space between words.
I hyped a friend about this and that's how everything started.

Then, I started writing a parser for a simple language,
and my hyped friend reimplemented the LaTeX's algorithm for justification,
and we're making a little progress. We're quite excited to see where this goes.

[pdf-canvas]: https://crates.io/crates/pdf-canvas
[printpdf]: https://crates.io/crates/printpdf

### Language

Of course, if we want to rewrite LaTeX, we need a language. After discussing with friends, we chose to make a markdown-like language, and in the future, extend it with template-style syntax. For example, this can be a typical SpanDeX source:

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

### Output

This is what SpanDeX will generate from the example:

![](spandex.png)

### Try it

All the instructions are described one the [homepage][homepage] but to put it simply, you need to:

- install rust (`curl -sSf https://sh.rustup.rs | sh`)
- install spandex (`cargo install spandex`)
- initialize a project (`spandex init example`)
- go to the generated example (`cd example`)
- build the pdf (`spandex build`)

The output will be saved to `output.pdf`,
and you can have fun with your `main.dex` file and re-running `spandex build`.

[homepage]: https://rust-spandex.github.io/

### Long term future

There are some basic features that will need to be included (like lists, code blocks, includes, images, etc...) but here are some features that we would like to have on the long term:

- vector graphics like TikZ, or possibility to include SVG
- possibility to write plugins in Rust
- parallel compilation
- incremental compilation
- online editor using WASM
