+++
title = "New package alternative/complementary to elm/file"
date = 2021-03-20
template = "post-item.html"

[extra]
thumbnail = "elm-file-example.png"
# header = "header.png"
+++

Package: [GitHub - mpizenberg/elm-file: Alternative to elm/file that can be encoded and passed through ports](https://github.com/mpizenberg/elm-file)
Ellie: [https://ellie-app.com/cGtMSj4QnPWa1](https://ellie-app.com/cGtMSj4QnPWa1)

I am in need of processing files with WebAssembly on a recent project but the `File` type provided by [`elm/file`](https://github.com/elm/file) cannot be encoded and sent to JS via a port.

<!-- more -->

So I’ve been using an alternative `File` type defined as

```elm
type File =
    { value : Json.Decode.Value
    , name : String
    , mime : String
    , size : Int
    , lastModified : Time.Posix
    }
```

It is quite convenient to pass through a port and can still be transformed into the official `File` type via its decoder if needed. I’ve also added helper functions to upload files via file input or drag and drop. [Here is an example Ellie](https://ellie-app.com/cGtMSj4QnPWa1).

[![Ellie example usage of elm-file](elm-file-example.png)](https://ellie-app.com/cGtMSj4QnPWa1)
