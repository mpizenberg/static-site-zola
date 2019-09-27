# Academic template for static site with Zola

[Zola][zola] is a static site builder in Rust.
It is fast and generates a static site that can be hosted
anywhere, included on github pages.

This template is well suited for academic sites.
The styling is done with [bulma][bulma].
If you wish to reuse it, there are very simple steps.

1. [Install zola][zola-install]
2. Clone this repository
3. Use `zola serve` to build and serve locally the site

[zola]: https://github.com/getzola/zola
[zola-install]: https://www.getzola.org/documentation/getting-started/installation/
[bulma]: https://bulma.io/

## Adapt the data to you

- Change the `title` and `navbar` elements in `config.toml`.
- To modify the content, adapt the files in the `content/` directory.
- To modify the appearance, change the files in the `templates/` directory.
- Make sure the modifications at both places match with each other.

## Publish the static site on github pages

1. Set gh-pages branch on a specific subdirectory worktree:
   `git worktree add gh-pages-static/ gh-pages`
2. Push at least once the gh-pages branch: `cd gh-pages-static`, `git push origin gh-pages -u`
3. Change the base url in the `publish.sh` script.
4. Everytime you want to update the static site online,
   just run the `./publish.sh` command from the repository root.
