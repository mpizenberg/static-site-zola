+++
title = "Rust Photogrammetry P3P"
date = 2019-09-12
template = "project-item.html"

[extra]
authors = ["Matthieu Pizenberg"]
teaser = "Camera pose estimation given 3D points and corresponding pixel coordinates"
thumbnail = "p3p.jpg"
# header = "header.png"
links = [
    {name = "Code", url = "https://github.com/rust-photogrammetry/p3p"},
]
+++

This project is kind of a sub-project for interactive visual odometry.
In order to provide an human interaction enabling re-alignement of drifted frames,
we chose to use a P3P algorithm.
The idea is simple, given a number of N points with 3D coordinates in a reference frame,
if we provided the associated N 2D points in another frame,
it is possible to estimate the camera transformation between the reference and second frame.
These algorithms are called **["Perspective-N-Point"][pnp] or PNP**,
and 3 is the minimal amount of points required for the estimation.

I've extracted this Rust implementation of P3P from the interactive visual odometry code base
into the **[Rust Photogrammetry][rust-p3p] organization** since it might be useful to others.

[pnp]: https://en.wikipedia.org/wiki/Perspective-n-Point
[rust-p3p]: https://github.com/rust-photogrammetry/p3p

In the interactive web application, a user can clic three points on two thumbnails.
They are displayed purple, blue and green as shown in the following image.
The left thumbnail is the reference frame.
Points with known depth information are displayed in red,
so the user should clic near those points because the code will associate
the nearest known 3D point to the clic for the reference frame.
On the right is the second frame.

![](p3p.jpg)

Once the third (green) point is associated in both images,
we compute the possible camera transformations with P3P.
There can be 0 to 4 solutions depending on the associated points.
In order to pick the correct one for re-alignement,
we display a projected point cloud in a different color for each potential solution.
The red point cloud being the projection with the initial drifted camera pose.
Below are two examples, one with two, the other with four potential solutions.

![](two-solutions.png)

![](four-solutions.png)

The implementation is inspired by [OpenMVG implementation][p3p-openmvg] of
"Lambda Twist: An Accurate Fast Robust Perspective Three Point (P3P) Solver"
Persson, M. and Nordberg, K. ECCV 2018
(reference implementation available on the [author github repository][lambda-twist-github]).

[p3p-openmvg]: https://github.com/openMVG/openMVG/pull/1500
[lambda-twist-github]: https://github.com/midjji/lambdatwist-p3p
