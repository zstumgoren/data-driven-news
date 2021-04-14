### Watch and do

Watch and follow along with this [Git Tutorial for Beginners video][]. It introduces the most important git concepts you'll need for collaborative coding.

[Git Tutorial for Beginners video]: https://www.youtube.com/watch?v=HVsySz-h9r4


> If you already have git installed and configured (see below), you should skip those steps during the first part of the video.

> For the second half of the tutorial on working with [remote repositories](https://www.youtube.com/watch?v=HVsySz-h9r4&t=895s) (roughly the 14:50 mark), you should [fork][] and clone _your own copy_ of the  [git-beginners-tutorial repository][]. Changes should be applied to this repo for the remainder of the tutorial and pushed to your fork.

[git-beginners-tutorial repository]: https://github.com/stanfordjournalism/git-beginners-tutorial
[fork]: https://docs.github.com/en/github/getting-started-with-github/fork-a-repo

**Don't passively watch the video.** Create your own versions of these files as you watch the video and practice the commands.

You don't need to recreate the files precisely as seen on video (e.g. just create a dummy `calc.py` file). You can use basic shell commands (e.g. `touch .project`) and your code editor to mimic the content changes, even if your files don't precisely match those seen in the video.

The goal is to learn and practice the following concepts and techniques:

* Initializing a new repo and cloning an existing "remote" repo
* Staging changes to be committed to a local git repository
* Committing changes to a local git repository
* Pushing committed changes to a remote repoistory
* Creating code in branches
* Merging changes from branches into the "main" branch

### Submit

To complete this assignment, you must submit the link to your updated [fork][] of the [git-beginners-tutorial repository][] via Canvas.


### Installation

> Additional install options for various operating systems can be found
> [here](https://www.atlassian.com/git/tutorials/install-git).

Mac users should check to see if they already have git:

```
# in a command-line terminal
git --version
```

If you don't already have git, Mac users should do the below:

```
xcode-select --install
OR
brew install git
```

> The [Git Tutorial for Beginners video][] will walk you through additional configuration steps.

### Important notes

- GitHub recently switched the name of the primary or default branch from `master` to `main`. Git itself is likely to adopt this (or a similar) change in the near future.

  If you get a warning about this change when running `git init`, follow the instructions to set `main` as your default branch for all new projects.

- The video tutorial uses `git restore <filename>` to unstage files, but newer versions of git use `git rm --cached <filename>`.


### Further reading

See the [Git Book][] for more details on concepts and syntax.

[Git Book]: https://git-scm.com/book/en/v2

