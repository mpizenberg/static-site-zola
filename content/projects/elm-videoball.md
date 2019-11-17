+++
title = "Elm Videoball"
date = 2018-09-19
template = "project-item.html"

[extra]
authors = ["Matthieu Pizenberg", "Nicolas Gaboris", "Matthias Benkort", "Thomas Forgione"]
teaser = "Minimalist elm implementation of the game videoball (not affiliated to official game)"
thumbnail = "elm-videoball.png"
# header = "header.png"
links = [
    {name = "Code", url = "https://github.com/mpizenberg/elm-videoball"},
    {name = "Game", url = "https://mpizenberg.github.io/elm-videoball/"},
]
+++

This is a minimalist elm implementation of the game [videoball][videoball].
You play by controlling a small triangle moving around and shooting
bullets on the balls to make them move to the opposite goal
or on the two opponent players to stall them temporarily.
**It is a lot of fun!**
You can play the game in your browser (currently only chrome) at
[mpizenberg.github.io/elm-videoball][game].
It requires 4 human players, with 4 gamepad controllers.
You can check that your gamepad controllers should work at
[html5gamepad.com][html5gamepad].

> This is not affiliated to the official game.
> If you like this game, you will very much like the original one.

![](elm-videoball.png)

This game is done using the [Elm programming language][elm].
We made it for the fun and to show that it is quite easy to make games in Elm.
It uses [elm-gamepad][elm-gamepad] to handle game controllers through ports,
and [howler.js][howler] through ports for sounds.
The game is rendered in SVG.

Regarding the architecture,
objects that can have physical interactions with each other
are in modules inside the `Physical/` directory.
Other important data structures are in the `Data/` directory.
Visuals are under the `Views/Svg/` directory.
Have fun playing it!

[videoball]: http://videoball.net/
[game]: https://mpizenberg.github.io/elm-videoball/
[html5gamepad]: https://html5gamepad.com/
[elm]: https://elm-lang.org/
[elm-gamepad]: https://github.com/xarvh/elm-gamepad
[howler]: https://howlerjs.com/
