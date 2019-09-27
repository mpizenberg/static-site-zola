+++
title = "MATRIX"
date = 2017-06-18
template = "project-item.html"

[extra]
authors = ["Matthias Benkort", "Nicolas Gaboris", "Arthur Manoha", "Matthieu Pizenberg", "Louis Viot"]
teaser = "MVG (Multiple View Geometry) Assistant Tool for Reconstruction from Images eXtraction"
thumbnail = "/matrix_128.png"
header = "/matrix_header.png"
links = [
    {name = "Code", url = "https://github.com/mpizenberg/MATRIX"},
    {name = "Documentation", url = "https://oeufsdepie.github.io/MATRIX/index.html"},
]
+++

### What is MATRIX ?

MATRIX is a project we developed in the context of a last-year 7-week school group project in 2015.
This project aimed at developing a tool to ease the task of collecting
a dataset of pictures of a scene for 3D reconstruction.
The project was casted in the context of the European Project [POPART][popart],
in which the team [VORTEX][vortex] and [Mikros Image][mikros] are involved.
POPART aims at developing tools for the realime previsualization of special effects
during the shooting of a movie.
In such context, the preliminary task is to collect a dataset of images of the scene
where the movie will take place and perform an accurate 3D reconstruction of the scene,
that will later be used for realtime camera localization purpose.

{{ youtube(id="frpuu8nP56w", class="youtube") }}

[popart]: http://www.popartproject.eu/
[vortex]: http://www.irit.fr/-Equipe-VORTEX-
[mikros]: http://www.mikrosimage.eu/

### Documentation

You will find the documentation of the project on [github][doc].

[doc]: http://oeufsdepie.github.io/MATRIX/index.html

### Related projects and useful resources

- [OpenMVG][openmvg]: a library for computer-vision scientists
  and especially targeted to the Multiple View Geometry community.
- [libgphoto][libgphoto]: a library designed to allow access to digital camera by external programs.
- [Qt][qt]: a cross-platform application framework for developing softwares with graphical user interfaces (GUIs).

[openmvg]: https://github.com/openMVG/openMVG/
[libgphoto]: http://www.gphoto.org/
[qt]: http://www.qt.io/
