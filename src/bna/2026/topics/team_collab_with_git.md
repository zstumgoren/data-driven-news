---
layout: layouts/topics.njk
title: Team Collaboration with Git
description: Overview of git syntax and workflows.
tags:
  - topicpages2026
---

<img src="https://docs.google.com/drawings/d/e/2PACX-1vQEyVwhFQ2UmMuVl3j4O3QEOms6V8D4rW1JaIfjfbRjnjcLhT7BBy3EJlsa_bTiclXYnQGF3mEU3lcJ/pub?w=480&amp;h=360">



## Overview

As members of a team, we often work in our own corners of the project code.

A designer may create HTML and CSS files to bring the "front end" to life, while a second team member focuses on writing Javascript to add data and interactivity to the page. A third teammate may write web scrapers in Python to acquire data and generate JSON for interactive visualizations.

Although each member on such a team often works on separate directories and files, it's important for each person to stay up-to-date with the code produced by the rest of the team.  [Version control][] tools -- and git in particular -- are the secret ingredient that allow teams to _easily_ share, synchronize and integrate their code.

[Version control]: https://en.wikipedia.org/wiki/Version_control

Such tools offer a variety of benefits:

* A way to easily incorporate the latest changes from teammates
* A history of changes
* The ability to "roll back" to prior versions of the code
* A mechanism for surfacing and resolving code conflicts

Today, we'll review how to use the Git version control system and GitHub for collaborative workflows.

## Resources

Here are some useful resources:

* Conceptual diagrams:
  * [Different types of workflows with git/GitHub](https://docs.google.com/drawings/d/1ew9kXxy2CFbEBE0XA0HPazuxHW3-Njc0B0srTmsUx-4/edit?usp=sharing)
  * [Team Workflow with GitHub](https://docs.google.com/drawings/d/1ii6PBgxdyffeIoGvkKmxFh7iwfHMpBjl7uEacWMO15o/edit?usp=sharing) - the approach we recommend using for this class
  * [Daily Individual Workflow with GitHub](https://docs.google.com/drawings/d/1eOYOD7rX12xi3WUBdIuKEsj9gt-RvQvQ9USoCzKkRPs/edit?usp=sharing) - the recommended approach for this class
* [Git book](https://git-scm.com/book/en/v2) - Appendix C is especially helpful for quick overviews and reminders on commands
* [Git cheatsheet](https://education.github.com/git-cheat-sheet-education.pdf)

## Code conflicts

Git is a sophisticated tool that often does the correct, or sensible, thing in a variety of contexts. In particular, it's very smart about merging code from one branch into another.

In many cases, the below will "just work":

```bash
# Merge dev branch into main
git checkout main
git merge dev
```

But there will be times when team members produce conflicting code changes. This often happens when two people modify the same area of a single file.

In such cases, git will warn of a [merge conflict][] when you try to merge branches, and will require you to manually resolve such a conflict before allowing the merge operation to complete.

[merge conflict]: https://git-scm.com/docs/git-merge#_how_conflicts_are_presented

This is a common and natural part of collaborative coding, and it's important to gain familiarity with the process for resolving merge conflicts.

Often, the *key* to resolving conflicts is communication with teammates. A quick Slack message or a few minutes of pair programming can help sort out which code changes should be kept and which discarded.
