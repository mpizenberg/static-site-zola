+++
title = "Announcing pubgrub v0.2: a flexible version solver in Rust"
date = 2020-11-19
template = "post-item.html"

[extra]
thumbnail = "noimage.png"
# header = "header.png"
+++

PubGrub is a version solving algorithm based on conflict driven nogood learning, created by Natalie Weizenbaum for the package manager of the Dart programming language. Its goal is to compute a set of package versions that satisfies all dependencies of a project, and it aims at being faster than the alternatives, while giving better explanations when no solution is possible.

<!-- more -->

[This crate](https://github.com/pubgrub-rs/pubgrub) is an implementation from scratch of the PubGrub algorithm in Rust. It is generic over the package and version types to provide maximum flexibility. [A guide](https://pubgrub-rs-guide.netlify.app/) is also provided to walk you through its high-level features and internal details. Beware that it's still a WIP so API changes will continue to occur but we are now ready for community feedback.
