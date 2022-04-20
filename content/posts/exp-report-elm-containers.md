+++
title = "Experience report on setting up elm test runners in isolated containers"
date = 2020-02-02
template = "post-item.html"

[extra]
thumbnail = "elm-on-docker.png"
# header = "header.png"
+++

We are currently setting up some elm test runners based on docker containers.
The test runners are aimed at testing students code on various exercises and we have three constraints, (1) no network access, (2) read-only except specific directories and (3) no compilation cache.
This is a small report on things making this setup more difficult than it could.

<!-- more -->

### (1) no network access

Elm is already capable of running without network access as long as package dependencies already are downloaded in `ELM_HOME`.
We have a restricted set of packages used throughout the exercises so that is not an issue.
One thing we struggled with though was generating that minimal `ELM_HOME`.
Exercises are setup as `elm.json` projects (not elm packages) so they require specific versions of packages.
We have had issues because we didn’t realize that we only put a newer version of some package in `ELM_HOME` while an exercise required an older one.
Error messages for that case are not very clear.

A possible solution to this would be a script abled to generate an `ELM_HOME` with all versions available of a restricted set of packages.

### (2) read-only

Elm actually requires to write to `ELM_HOME/0.19.1/packages/lock` so this cannot be in a read-only part of the container.
I believe this was introduced to prevent issues when multiple processes are trying to compile stuff at the same time, such as your file watcher, the text editor, etc.
In our case, it requires us to copy the full `ELM_HOME` into the writable mounted part of the container for each exercise tested.
Maybe other parts of `ELM_HOME` also need write access.
We did not check that since the lock issue was the first one and required this copy.

We also have to copy the source code folder.
This could be prevented if we could choose the location of `elm-stuff/`.

### (3) no exercise cache

This is more a performance issue.
While other test runners in ruby, JS, Go are quite snappy, ours is quite slow to answer.
I think there are issues with different parts of elm and elm-test.
Elm has wonderful performances for compilation of huge code bases but I’m wondering if things could be improved for small code bases.
For example, I have a small 40 LoC lone module `WordCount` depending only on `Dict`.
The command `time elm make src/WordCount.elm --output=/dev/null` takes 1.3 seconds to complete.
This is quite fast, but compared to [people compiling 28k LoC in 1.9 seconds](https://discourse.elm-lang.org/t/community-beta-for-elm-0-19-1/4102/19) it feels like we could do better.

Weirder, compilation with no network takes much longer.
`time elm make src/WordCount.elm --output=/dev/null` clocks at 5 full seconds when I deactivate network connectivity.
This is a little annoying since our containers are also with no network connectivity.

On top of `elm make` we have to add `elm-test`.
In our case, for roughly 10 simple unit tests (no fuzz) it adds approximately 1.3 seconds so we arrive at 2.6 seconds with network, and 6.3 without.
