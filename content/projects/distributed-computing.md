+++
title = "Distributed Computing"
date = 2016-09-04
template = "project-item.html"

[extra]
authors = ["Matthieu Pizenberg", "Thomas Forgione"]
teaser = "Your 10h+ computing sessions in the blink of an eye!"
thumbnail = "distributed-computing-flow.png"
# header = "header.png"
links = [
    {name = "Python code", url = "https://github.com/mpizenberg/distributed_computing"},
    {name = "Bash helpers", url = "https://github.com/mpizenberg/distributed_computing_tools"},
]
+++

If you happen to have ssh access to a network of 200 computers unused at night,
you can have a lot of *computing* fun.
This mini-project is composed of two parts,

1. a [python library][python-code] with two main scripts `start_computing_server.py`
   and `start_computing_client.py` that connect to each other and distribute work,
2. a [set of utilitary bash scripts][bash-code] to help prepare the remote machines
   before work distribution, such as sending files, synchronizing some directories, etc.

[python-code]: https://github.com/mpizenberg/distributed_computing
[bash-code]: https://github.com/mpizenberg/distributed_computing_tools

The general workflow of setup, work distribution and collection is as follows.

![Distributed workflow](distributed-computing-flow.png)
