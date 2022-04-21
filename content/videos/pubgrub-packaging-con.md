+++
title = "Building a flexible dependency solver in Rust - Matthieu Pizenberg & Jacob Finkelman | PackagingCon"
date = 2021-11-09
template = "video-item.html"

[extra]
teaser = "Dive into the core mechanisms of the pubgrub Rust library and discussion about its future"
thumbnail = "thumbnail.jpg"
+++

[Slides (pdf)](https://pretalx.com/media/packagingcon-2021/submissions/MXVTEA/resources/pubgrub-rs-packaging-con-2021_7gsJi7v.pdf)

Dependency solving is a hard problem, especially when mixed with additional features such as optional dependencies, multiple versions or availability of pre-releases. We present a rewrite from scratch of a recent algorithm called PubGrub, as a Rust library aiming at great performance and flexibility for reuse. We will dive into its core mechanisms, its high-level usage, as well as our new ideas enabling behavioral extensions such as optional dependencies, entirely in user space without changing the library API.

{{ youtube(id="XyJpYFnl18U", class="youtube") }}
