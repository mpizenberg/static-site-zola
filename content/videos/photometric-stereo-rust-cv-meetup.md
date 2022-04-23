+++
title = "Rust CV meeting 2021 09 29 - Photometric stereo on the web with Rust and Wasm - Matthieu Pizenberg"
date = 2021-09-29
template = "video-item.html"

[extra]
teaser = "How Rust can be used to port to the web computer vision algorithms such as photometric stereo"
thumbnail = "presentation.png"
+++

[[slides (pdf)]](https://mpizenberg.github.io/resources/calibrated-quasi-planar-photometric-stereo/photometric-stereo-web-rust-cv-sept-2021.pdf)
[[code (GitHub)]](https://github.com/mpizenberg/calibrated-quasi-planar-photometric-stereo)

Photometric stereo is a technique enabling 3D reconstruction of surfaces with high precision.
The approach consists in solving an inverse problem, where the observation data contains multiple images of the same object with varying lighting.
Thanks to WebAssembly, the algorithm can be efficiently ported from Rust to the Web.
This enables a friendlier user experience and improves accessibility of research work.

{{ youtube(id="oGjEF13Qmvs", class="youtube") }}
