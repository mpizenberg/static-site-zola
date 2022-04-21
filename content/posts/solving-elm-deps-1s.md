+++
title = "Solving dependencies of 11079 elm packages in less than 1s"
date = 2020-11-19
template = "post-item.html"

[extra]
thumbnail = "elm-version.png"
# header = "header.png"
+++

Dependency solvers are algorithms taking as input the direct dependencies of an app or a package and computing all versions of all packages that will be necessary for the code to run (including indirect dependencies).

<!-- more -->

For quite some time now I’ve been working on implementations of a state of the art dependency solver called PubGrub, originally [created by Natalie Weizenbaum][pubgrub-medium] for the Dart programming language.
I used elm to prototype my first implementation of PubGrub, which resulted in [elm-pubgrub][elm-pubgrub], that I [presented 4 months ago][elm-pubgrub-discourse].
Beware that there is actually a bug in that implementation that I’ve not fixed yet (sorry).

[pubgrub-medium]: https://medium.com/@nex3/pubgrub-2fb6470504f
[elm-pubgrub]: https://github.com/mpizenberg/elm-pubgrub
[elm-pubgrub-discourse]: https://discourse.elm-lang.org/t/elm-pubgrub-a-state-of-the-art-dependency-solver-in-elm/6077

But I have more plans for it, and to that end, I’ve reimplemented [PubGrub in Rust][pubgrub-rs] this time!
With the help of Jacob and Alex, we have improved everything from my initial draft and are working on making it a better alternative to the solver embedded in Cargo, Rust package manager.

[pubgrub-rs]: https://github.com/pubgrub-rs/pubgrub

Few days ago, I created an index, a registry of all 11079 published elm package versions (to date) between elm 0.14.0 and elm 0.19.1 with their direct dependencies, [all in one file][elm-direct-deps].
And today, I’m proud to say that we can solve dependencies of all those 11079 package versions with pubgrub in less than 1 second! (0.842s with an i7-10750H)
I’m now very confident that it will be a central piece for another project of mine, with hopefully more exciting news before Christmas!

[elm-direct-deps]: https://github.com/pubgrub-rs/pubgrub/files/5541663/elm-packages.zip

Doing that analysis of elm packages also brought a lot of insight and some surprises.
I’ll start with some statistics, followed by surprises (invalid packages in the elm registry).

## Statistics on elm packages

It’s always fun to explore data and to share some insight on that data.
So for this, I’ve generated [CSV file][stats-csv] containing the following fields per package version: id, author, package, version, elm-version, license, direct_dep_count, total_dep_count.
Once you plug that data into a tool like [vega data voyager][data-voyager], you can start exploring it and look for interesting patterns.

![Vega data voyager](data-voyager.png)

[stats-csv]: https://mpizenberg.github.io/resources/pubgrub-rs/elm/pkg_stats.csv
[data-voyager]: https://vega.github.io/voyager/

Here are some interesting plots, we can start with the number of package versions published per version of elm.

<img src="elm-version.png" alt="Number of package versions per version of elm" width="45%">

Now the most prolific authors, sorted by number of package versions published.

![Number of package versions per author](authors.png)

Here are the different licenses used in elm packages.

<img src="license.png" alt="Number of package versions per license type" width="45%">

It is also interesting to note that most packages have a low count of direct and indirect dependencies.

<img src="direct-deps.png" alt="Direct dependencies per package" width="45%">
<img src="total-deps.png" alt="Direct and indirect dependencies per package" width="45%">

## Bad surprises

While solving dependencies for all elm packages, I was surprised to see that some packages could not be solved.
So I did an analysis of all those packages and sorted the failures in different categories as follows.

#### Packages depending on non-existing packages

Some packages mentioned in dependencies do not exist in the elm registry. I suppose they may have existed at some point and were removed for some reason. As a consequence, there are a number of existing packages in the registry depending on them which can thus not be compiled anymore. Many of them depended on `maxsnew/io`, not existing anymore. Those are all elm 0.15 packages:

-   `sporto/erl` from 1.0.0 to 3.1.0
-   `jessitron/elm-param-parsin` 1.0.0
-   `nphollon/collisions` 1.0.0 and 1.0.1
-   `avh4/elm-spec` 1.0.0
-   `avh4/elm-diff` until 1.0.5
-   `chendrix/elm-matrix` from 2.0.1 to 3.0.0
-   `aluuu/elm-check-io`
-   `truqu/elm-base64` 1.0.0

Some depended on `Dandandan/easing`, these are elm 0.15 and elm 0.16 packages

-   `KtorZ/elm-notification` (elm 0.16)
-   `etaque/elm-transit-style` 1.0.0 and 1.0.1 (elm 0.16)
-   `etaque/elm-transit` 4.0.1 (elm 0.16)
-   `mgold/elm-animation` 1.0.0 and 1.0.1 (elm 0.15)

Also all packages from `spisemisu` do not appear to exist anymore in the packages registry. As a consequence, dependencies of the following elm 0.18 packages cannot be solved.

-   `nathanjohnson320/ecurve` depends on `spisemisu/elm-bytes`
-   `ktonon/elm-hmac` depends on `spisemisu/elm-bytes`
-   `arowM/elm-embedded-gist` 1.0.4 depends on `spisemisu/elm-sha`
-   `billstclair/elm-crypto-string` until 2.1.0 depend on `spisemisu/elm-utf8`

Many other packages (mostly elm 0.18) depend on non-existing ones:

-   `imeckler/iterator` until 1.1.1 (elm 0.14) depends on `uehaj/intrange` which does not exist.
-   `sindikat/elm-matrix` 1.1.0 and 1.2.0 (elm 0.15) depend on `sindikat/elm-array-experimental` which does not exist.
-   `rgrempel/elm-route-url` until 1.0.4 (elm 0.15) depends on `TheSeamau5/elm-history` which does not exist.
-   `krisajenkins/elm-exts` from 10.0.0 to 10.2.5 (elm 0.15) depends on `jterbraak/dateop` which does not exist.
-   `javcasas/elm-decimal` 1.0.0 (elm 0.16) depends on `javcasas/elm-integer` `< 2.0.0` which does not exist.
-   `Warry/elmi-decoder` depends on `Warry/ascii-table` which does not exist (`warry/ascii-table` exists though)
-   `cmditch/mel-bew3` depends on `Warry/ascii-table` which does not exist.
-   `cmditch/elm-ethereum` 1.0.0 and 1.0.1 depend on `Warry/ascii-table` which does not exist.
-   `ktonon/elm-serverless-cors` 1.0.0 and 1.0.1 indirectly depend on `ktonon/url-parser` which does not exist
-   `ktonon/elm-serverless` 3.0.0 to 3.0.2 depend on `ktonon/url-parser` which does not exist.
-   `danielnarey/elm-form-capture` depends on `danielnarey/elm-html-tree` which does not exist
-   `surprisetalk/elm-bulma` from 3.0.0 to 6.0.2 depend on `danielnarey/elm-bulma-classes` which does not exist
-   `Chadtech/ctpaint-keys` from 5.0.0 to 6.0.9 depend on `Chadtech/keyboard-extra-browser` which does not exist
-   `jfmengels/elm-lint` 1.0.0 depends on `jfmengels/elm-ast` which does not exist.
-   `the-sett/ai-search` 3.1.1 depends on `tsfoster/elm-heap` which does not exist (`TSFoster/elm-heap` exists though).
-   `the-sett/svg-text-fonts` 1.0.0 and 2.0.0 depend on `the-sett/elm-multi-dict` which does not exist.
-   `allo-media/koivu` from 4.0.0 to 4.1.1 depend `allo-media/canopy` `3.1.0 <= v < 4.0.0` which does not exist (only 1.0.0 exist).

#### Packages depending on two incompatible versions of elm

Some packages depend indirectly on an older version of elm, due to a dependency to an old version of `elm-lang/core`. I suspect those are errors happening at the transition between two elm versions.

-   `bakkemo/elm-collision` 1.0.0 is an elm 0.15 package depending on `elm-lang/core` `1.0.0 <= v < 2.0.0` which is an elm 0.14 package.
-   `eeue56/elm-flat-matrix` from 2.0.2 to 2.0.4 are elm 0.16 packages depending on `elm-lang/core` 2.1.0 which is an elm 0.15 package.
-   `jvoigtlaender/elm-warshall` 1.0.0 depends on `eeue56/elm-flat-matrix` 2.0.4 which itself is not solvable.
-   `mbr/elm-mouse-events` 1.0.3 is an elm 0.18 package depending on `elm-lang/core` 4.0.5 (elm 0.17)

And some packages are **back from the future**! They indirectly depend on a future version of elm. Impossible you might say! The relativity is broken! Well, not exactly. Some are elm transitions issues I guess, but one is due to packages not existing anymore. This is the one I prefer !

-   `EngageSoftware/elm-dnn-http` 1.0.0 is an elm 0.18 package depending on `EngageSoftware/elm-dnn-localization` which is an elm 0.19 package. (ps `elm-dnn-localization` starts at version 1.0.2 so maybe previous versions were elm 0.18 packages, but they don’t exist anymore in the package registry)
-   `garetht/elm-dynamic-style` 1.0.1 is an elm 0.15 package depending on `elm-lang/core` 3.0.0 (elm 0.16)
-   `sgraf812/elm-intdict` 1.4.0 and 1.4.1 are elm 0.15 packages depending on `elm-lang/core` 3.0.0 which is an elm 0.16 package.
-   `w0rm/elm-slice-show` 3.0.0 is an elm 0.16 package depending on `elm-lang/navigation` 1.0.0 which is an elm 0.17 package.
-   `vito/elm-ansi` 8.0.0 is an elm 0.16 package depending on `elm-lang/html` `1.0.0 <= v < 2.0.0` which is an elm 0.17 package.
-   `lattenwald/elm-base64` 1.0.2 and 1.0.3 are elm 0.17 packages depending on `elm-lang/core` `5.0.0 <= v < 6.0.0` which is for elm 0.18.
-   `nedSaf/elm-bootstrap-grip` 1.0.1 and 1.0.2 are elm 0.17 packages depending on `elm-lang/core` 5.1.1 (elm 0.18)

#### Indirect dependencies on two incompatible versions of the same package


Very similar than with elm itself, but this time regarding regular published packages. Some packages depend on other packages in a way that both depend on two incompatible ranges of versions of a same third packages.

-   `fresheyeball/elm-check-runner` 1.0.0 depends on `NoRedInk/elm-check` `2.0.0 <= v < 3.0.0` but both depend on incompatible versions of `elm-lang/core`.
-   `heyLu/elm-format-date` 1.0.0 depends on `deadfoxygrandpa/elm-test` `1.0.2 <= v < 2.0.0` but both depend on incompatible versions of `elm-lang/core`.
-   `nphollon/collision` 1.0.0 depends on `elm-community/elm-list-extra` 2.0.0 and both have incompatible dependencies on `elm-lang/core`.
-   `enetsee/facet-plot-alpha` from 2.0.1 to 2.0.3 depends on `enetsee/facet-scenegraph-alpha` and both have incompatible dependencies on `folkertdev/svg-path-lowlevel`.
-   `enetsee/facet-render-svg-alpha` until 1.0.3 depends on `folkertdev/one-true-path-experiment` 3.0.2 and both depend on incompatible versions of `folkertdev/svg-path-lowlevel`.
-   `lucamug/elm-style-framework` 5.0.1 depends on `lucamug/elm-styleguide-generator` `3.0.0 <= v < 4.0.0` but both depend on incompatible versions of `mdgriffith/stylish-elephants`.
-   `jonathanfishbein1/elm-comment` 5.0.3 depends on `lucamug/elm-style-framework` 6.0.0 and both have incompatible dependencies to `mdgriffith/stylish-elephants`.
-   `primait/elm-form` 11.0.0 and 12.0.0 depend on `Leonti/elm-material-datepicker` and both depend on incompatible versions of `rluiten/elm-date-extra`.
-   `Natim/elm-workalendar` 1.0.0 and 1.0.1 are depending on `akheron/elm-easter` and both have incompatible dependencies to `justinmimbs/elm-date-extra`.
-   `drathier/elm-graph-test` until 1.0.2 depends on `elm-community/elm-test` 3.1.0 but both depend on incompatible versions of `mgold/elm-random-pcg` so it is an impossible transitive dependency.
-   `circuithub/elm-bootstrap-html` 4.0.1 and 4.0.2 indirectly depend on two incompatible versions of `evancz/elm-html`

#### Indirect dependency on an older version of itself


I’m not sure how this one was not caught by the compiler.

-   `jonathanfishbein1/complex-numbers` 5.0.0 depends on `jonathanfishbein1/elm-field` `3.0.0 <= v < 4.0.0` which depends on `jonathanfishbein1/complex-numbers` `4.1.0 <= v < 5.0.0` so there is an impossible cycle.

#### Packages with mistakes in dependencies


Those are package author mistakes and should have been caught at package publication.

-   `eskimoblood/elm-wallpaper` 2.1.4 depends on elm version `"0.17.0 <= v < 0.17.0"`.
-   `krisajenkins/elm-dialog` until 1.0.2 depends on `laszlopandy/elm-console` `1.1.1 <= v < 1.1.1`.
-   `showel/elm-data-util` 1.0.0 has a duplicate `"elm-version"` field, one with the package syntax `"0.19.0 <= v < 0.20.0"` and one with the application syntax `"0.19.0"`. This made the deserializer of PubGrub solver fail.
-   `alex-tan/loadable` 1.0.0 has a duplicate `"elm-version"` field, one with the package syntax `"0.19.0 <= v < 0.20.0"` and one with the application syntax `"0.19.0"`. This made the deserializer of PubGrub solver fail.

## What should we do about it?

Most problematic packages are related to old versions of elm, but not all (the last two are 0.19 packages with a syntax issue in their elm.json).
Maybe all problematic packages should be removed from the package registry to prevent projects from depending on them since it is still possible to create elm 0.18 projects.
What do you think? (Ultimately it’s Evan’s decision anyway).
