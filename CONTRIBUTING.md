# Contributing to the website

This website uses Hugo as a static site generator and is hosted on GitHub Pages. To contribute to the website, you will need to install and configure:

1. Git
1. Go
1. Hugo

Fork this repository and clone your fork onto your local machine to make modifications.

Test the site and your modifications locally by running:

```zsh
➜  ~ hugo server -D
```

The `-D` option will show you pages still in draft mode.

## Writing a blog for the TLA+ website

If you would like to write a blog for the TLA+ website, follow these steps:

1. Create a new markdown file using the blog archetype by running:

```zsh
➜  ~ hugo new --kind blog blog/<blog title>/_index.md
```

This `_index.md` file will be prepopulated with the following markdown frontmatter:

```markdown
+++
type = "blog"
menuPre = " "
title = 'blog title'
linkTitle = ''
description = ""
date = <date that you ran the hugo new command>
draft = true
+++
```
2. Change the information in the `title`, `linkTitle`, and `description` to fit your content.

3. Below the last `+++`, write your content normally in markdown.

4. Preview your blog entry anytime by running:

```zsh
➜  ~ hugo server -D
```

5. Once you are happy with your blog entry, take it out of draft mode by changing the flag in the frontmatter:

```markdown
draft = false
```

6. Contribute your blog post upstream to this repository using the normal pull request mechanism.

While this website does not make use of all features available in the [Hugo Relearn theme](https://github.com/McShelby/hugo-theme-relearn), you can read its [documentation to learn more](https://mcshelby.github.io/hugo-theme-relearn/index.html).