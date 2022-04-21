+++
title = "Elm-test-rs v2.0 is out, now able to run your Lamdera tests"
date = 2021-12-02
template = "post-item.html"

[extra]
thumbnail = "noimage.png"
# header = "header.png"
+++

You can download v2.0 in the [release page](https://github.com/mpizenberg/elm-test-rs/releases), or via the latest version of [elm-tooling-cli](https://elm-tooling.github.io/elm-tooling-cli/) (thanks [@lydell](https://discourse.elm-lang.org/u/lydell)).

Much like elm-test, elm-test-rs is a tests runner for your elm tests. Runtime performances of the two are roughly the same, but elm-test-rs provides a few unique features, such as `Debug.log` capture, tests filtering, ability to run on Deno, and a few other things. Check out the [readme](https://github.com/mpizenberg/elm-test-rs) if you’re interested in all the features.

<!-- more -->

In version 2.0, the dependency solver has been upgraded to be compatible with [Lamdera](https://lamdera.com/) projects. Previously, elm-test-rs had two strictly separated modes, an offline mode and an online mode. Offline mode would be able to pick up dependencies living in `ELM_HOME`, while online mode would pick up dependencies existing according to the package website. So online mode could not work with lamdera projects, and offline mode could not work if at least one test dependency was missing from the elm home local cache. This is now fixed with the online mode being able to combine existing dependencies listed on the package website (no lamdera) and those existing locally. The only thing needed to have elm-test-rs working with your lamdera packages is to have compiled at least once your lamdera project to get the lamdera packages in your local cache.

There are a few other changes in this version, the detail is available in the [changelog](https://github.com/mpizenberg/elm-test-rs/blob/v2.0/CHANGELOG.md). Big thanks to Julian Antonielli who is a new contributor for this release!

## Roadmap

The elm-test-rs test runner is mainly developed on my free time, free time that is highly disputed with other side projects and time spent with friends and family. As such, I do not have a clear roadmap or any deadline in mind since I cannot predict when I’ll have both the time and desire to make progress here. However I can outline the priorities for this project.

1.  Be usable with the latest version of Elm. This means when a new version of elm is released, which becomes incompatible, my priority will be to update elm-test-rs as soon as possible.
2.  Be reactive to answer user requests and bugs. If those are easy fixes, do it or outline the fix idea for a PR. If those are not easy fixes, either try explaining why they would take some time, or why they won’t be done.
3.  Try some cool new ideas that would improve user experience and ease of use.

Something I’d also love is to have enough community members familiar with the code base of elm-test-rs, that I could eventually fully delegate the project to others I trust. As such, all contributions, be it bug reports, ideas, and of course pull requests, are welcome. Everyone should feel welcome in this project, and I shall change anything going against this.

## Cool new ideas

#### Language server integration

In order to improve user experience in IDEs, we’ve started discussions with the language server maintainers to try an integration of elm-test-rs. There was some challenges, and some of them have been fixed in this v2.0 release but we are not finished yet. There would be some interesting speed advantages to check that the tests compile since elm-test-rs does not start a Node runtime before actually running the tests. Not much gains regarding actual tests running however since this takes roughly the same time.

#### Web runner and report

Currently, elm-test-rs supports both Node and Deno runtimes. In the future, I’d like to also have a Web runtime, which would enable running Elm tests without even needing an installation of Node or Deno, just have a compatible Web Browser. The actual JS code for the runner should be very similar to Deno, so there would not be a need for a ton of work there I think. However, there would be quite some work around the communication between elm-test-rs and the browser, on the reports, and on the watch mode.
