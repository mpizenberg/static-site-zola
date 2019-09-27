+++
title = "Microgeometry capture and RGB albedo estimation by photometric stereo without demosaicing"
date = 2017-05-14
template = "research-item.html"

[extra]
authors = ["Yvain Quéau", "Matthieu Pizenberg", "Jean-Denis Durou", "Daniel Cremers"]
publication = "International Conference on Quality Control by Artificial Vision (QCAV) 2017"
links = [
    {name = "Paper", url = "https://www.irit.fr/~Jean-Denis.Durou/PUBLICATIONS/qcav_2017.pdf"},
    {name = "Code", url = "https://github.com/yqueau/microgeometry_ps"},
]
header = "/qcav_17.jpg"
+++

### Abstract

We present a photometric stereo-based system for retrieving the RGB albedo and the fine-scale details of an opaque surface. In order to limit specularities, the system uses a controllable diffuse illumination, which is calibrated using a dedicated procedure. In addition, we rather handle RAW, non-demosaiced RGB images, which both avoids uncontrolled operations on the sensor data and simplifies the estimation of the albedo in each color channel and of the normals. We finally show on real-world examples the potential of photometric stereo for the 3D-reconstruction of very thin structures from a wide variety of surfaces.
