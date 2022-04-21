+++
title = "A new GitHub action for your Elm CI"
date = 2021-02-25
template = "post-item.html"

[extra]
thumbnail = "elm-tooling-action.svg"
# header = "header.png"
+++

Hi all, I’ve just published a GitHub action to let you install elm and other tools supported by [elm-tooling.json](https://elm-tooling.github.io/elm-tooling-cli/) in your CI, the most "boring" way possible as would say Brian.

<!-- more -->

This is what using it in your CI config looks like:

```yml
  - name: Install elm, elm-format and cache the ELM_HOME directory
    uses: mpizenberg/elm-tooling-action@v1.0
    with:
      cache-key: elm-home-${{ hashFiles('elm-tooling.json', 'elm.json') }}

  - name: Making sure the installation worked
    run: elm --version
```

And your associated `elm-tooling.json` would look like this:

```json
{
  "tools": {
    "elm": "0.19.1",
    "elm-format": "0.8.5"
  }
}
```

More info on the [project page](https://github.com/mpizenberg/elm-tooling-action).
