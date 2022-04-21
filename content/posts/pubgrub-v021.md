+++
title = "Announcing version 0.2.1 of pubgrub, a dependency solver in Rust"
date = 2021-06-30
template = "post-item.html"

[extra]
thumbnail = "noimage.png"
# header = "header.png"
+++

[This release](https://github.com/pubgrub-rs/pubgrub/releases/tag/v0.2.1) is focused on performance improvements and code readability, without any change to the public API.

<!-- more -->

The code tends to be simpler around tricky parts of the algorithm such as conflict resolution. Some data structures have been rewritten (with no unsafe) to lower memory usage. Depending on scenarios, version 0.2.1 is **3 to 8 times faster** than 0.2.0. As an example, solving all elm package versions existing went from 580ms to 175ms on the same laptop. While solving a specific subset of packages from crates.io went from 2.5s to 320ms on the same laptop.

From now on, our focus can shift to expanding the limits of what's currently possible, with new APIs and tweaked algorithms. In particular, we are interested in exploring the complex subject of pre-releases, that poses some challenges to handle in principled and not hacky ways.
