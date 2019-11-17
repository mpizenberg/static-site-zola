+++
title = "Visual Odometry in Rust (vors)"
date = 2019-10-07
template = "project-item.html"

[extra]
authors = ["Matthieu Pizenberg"]
teaser = "Pure Rust visual odometry algorithm for RGB-D camera tracking"
thumbnail = "vors-3d.png"
header = "vors-3d-header.png"
links = [
    {name = "Code", url = "https://github.com/mpizenberg/visual-odometry-rs"},
]
+++

Currently, **visual-odometry-rs**, abreviated **vors**,
provides a framework for direct RGB-D camera tracking.
A research paper is intended but not finished yet.
The code is available online on GitHub at [github.com/mpizenberg/visual-odometry-rs][vors].
Self contained examples for usage of the API are available in the `examples/` directory.
A readme is also present there for more detailed explanations on these examples.
Have a look at [mpizenberg/rgbd-tracking-evaluation][rgbd-track-eval]
for more info about the dataset requirements to run the binary program `vors_track`.
The library is organized around four base namespaces:

- `core::` Core modules for computing gradients, candidate points, camera tracking etc.
- `dataset::` Helper modules for handling specific datasets.
  Currently only provides a module for TUM RGB-D compatible datasets.
- `math::` Basic math modules for functionalities not already provided by [nalgebra][nalgebra],
  like Lie algebra for so3, se3, and an iterative optimizer trait.
- `misc::` Helper modules for interoperability, visualization, and other things that did
  not fit elsewhere yet.

[vors]: https://github.com/mpizenberg/visual-odometry-rs
[rgbd-track-eval]: https://github.com/mpizenberg/rgbd-tracking-evaluation
[nalgebra]: https://www.nalgebra.org/

Initially, this repository served as a personal experimental sandbox for **computer vision in [Rust][rust]**.
See for example my original questions on the rust [discourse][discourse] and [reddit channel][reddit].
Turns out I struggled a bit at first but then really liked the Rust way, compared to C++.

As the name suggests, the focus is now on [visual odometry][vo],
specifically on the recent research field of direct visual odometry.
A reasonable introduction is available in those [lecture slides][vo-slides]
by Waterloo Autonomous Vehicles lab.
This project initially aimed at improving on the work of [DSO][dso]
by J. Engel et. al. but with all the advantages of using the [Rust programming language][rust],
including:

- [C++ level of performance][msrc-why-rust] without sacrificing code readability
- [No memory bug][ownership], and much higher [code safety][msrc-safety] and reliability
- [Friendly tooling and ecosystem][cargo], no dependency issue, basically one-liner compilation and run
- [Best-in-class support for porting to the Web with WebAssembly][rust-wasm]
- [Growing and mindful resources for porting to embedded systems][rust-embedded]
- [Wonderful][rust-forum] [community][rust-reddit]

[discourse]: https://users.rust-lang.org/t/computer-vision-in-rust/16198
[reddit]: https://www.reddit.com/r/rust/comments/84s5zo/computer_vision_in_rust/
[vo]: https://en.wikipedia.org/wiki/Visual_odometry
[vo-slides]: http://wavelab.uwaterloo.ca/slam/2017-SLAM/Lecture14-Direct_visual_inertial_odometry_and_SLAM/slides.pdf
[dso]: https://github.com/JakobEngel/dso
[rust]: https://www.rust-lang.org/

[ownership]: https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html
[msrc-why-rust]: https://msrc-blog.microsoft.com/2019/07/22/why-rust-for-safe-systems-programming/
[msrc-safety]: https://msrc-blog.microsoft.com/2019/07/18/we-need-a-safer-systems-programming-language/
[cargo]: https://doc.rust-lang.org/cargo/
[rust-wasm]: https://rustwasm.github.io/docs/book/
[rust-embedded]: https://docs.rust-embedded.org/discovery/
[rust-forum]: https://users.rust-lang.org/
[rust-reddit]: https://www.reddit.com/r/rust/

I didn't intend to rewrite everything from scratch.
I spent literally months on dissecting DSO's code,
trying to add improvements I had in mind,
only to face memory crashes, unpredictable side effets of my additions
to the previous code, and [unanswered questions][unanswered].
That is when I decided to start from a clean slate in Rust.
Setting all this from the ground up took a lot of time and effort,
but I think it is mature enough to be shared as is from now on.
Beware, however, that the API might evolve a lot (irregularly).
My hope is that in the near future, we can improve the reach of this project
by working both on research extensions, and platform availability.

Example research extensions:

- Using disparity search for depth initialization to be compatible with RGB (no depth) camera.
- Adding a photometric term to the residual to account for automatic exposure variations
  (some work happening in the photometric branch).
- Adding automatic photometric and/or geometric camera calibration.
- Building a sliding window of keyframes optimization as in [DSO][dso] to reduce drift.
- Intregrating loop closure and pose graph optimization for having a robust vSLAM system.
- Fusion with IMU for improved tracking and reducing scale drift.
- Modelization of rolling shutter (in most cameras) into the optimization problem.
- Extension to stereo cameras.
- Extension to omnidirectional cameras.

Example platform extensions:

- Making a C FFI to be able to run on systems with C drivers (kinect, realsense, ...).
- Porting to the web with WebAssembly
  (some work happening in the interactive vors repository).
- Porting to ARM for running in embedded systems and phones.

[unanswered]: https://github.com/JakobEngel/dso/issues/126
