+++
title = "Updates on elm-test, elm-test-rs, exercism"
date = 2022-04-16
template = "post-item.html"

[extra]
thumbnail = "elm-test-rs-listing.png"
# header = "header.png"
+++

I have a few exciting news to share related to those things I'm involved in.

TLDR:

- New version of [elm-test](https://github.com/rtfeldman/node-test-runner) on master (not published yet) with compatibility with [lamdera](https://lamdera.com/)
- New version of [elm-test-rs](https://github.com/mpizenberg/elm-test-rs/releases/tag/v2.0.1) that can print a list of all tests run
- The elm track on [exercism](https://exercism.org/tracks/elm) now has tests grouped by tasks, and an analyzer activated on all exercises, powered by elm-review

<!-- more -->

## elm-test compatibility with lamdera

Lamdera is very interesting platform for full stack elm apps, but since it's core packages are different than the core elm packages, this was causing an issue with how elm-test was resolving test dependencies. There is now a new approach for the dependency solver of elm-test, that is compatible with lamdera! Many thanks to @harrysarson , @lydell and @avh4 for the help!

But since the whole solver was change, we would love feedback from the community to make sure we didn't break your tests. **If you can, don't hesitate to try out the [master branch of elm-test](https://github.com/rtfeldman/node-test-runner)**.


## elm-test-rs v2.0.1 with a tests listing

The new version of [elm-test-rs v2.0.1](https://github.com/mpizenberg/elm-test-rs/releases/tag/v2.0.1) now prints a list of all tests that were run when using the verbose `-v` command line argument. Thanks all who participated in [the survey](https://discourse.elm-lang.org/t/do-you-want-a-list-of-all-tests-passing-and-failing-in-your-console-test-reports/8249). And thanks @Augustin82 for the feature idea, discussions and PoC.

![Listing of the tests run](elm-test-rs-listing.png)

## exercism elm track now has an analyzer

Exercism is a community-run learning platform where people can learn and mentor. The [elm track](https://exercism.org/tracks/elm) now takes advantage of @jfmengels fabulous [elm-review](https://github.com/jfmengels/elm-review) to provide automatic feedback to students in addition to the human mentoring they can get.

![Analyzer](exercism-analyzer.png)

And the updates on the `--report exercism` in addition to changes in the elm track repo also enables grouping of tests by tasks!

![Tests grouped by tasks](exercism-tasks.png)

Thanks a lot @jiegillet and @ceddlyburge for your work on this!
