---
layout: layouts/topics.njk
title: Project Planning
description: Drafting a roadmap with GitHub Milestones
tags:
  - topicpages2025
---

![estimating time xkcd comic](/static/img/estimating_time.png)

> [XKCD](https://xkcd.com/1658/)

## Overview

This quarter we've adopted a variety of strategies and tools to help us grow as coders and execute a team project:

* [User Stories](../beats_and_user_stories##who-are-your-users-what-are-their-needs)
* [SMART Goals](../smart_roadmap/)
* [Team Collaboration with Git](../team_collab_with_git/)
* [Daily Stand-ups](../daily_standup/)

Today, we'll add one more piece to the puzzle: [GitHub Milestones][].

Milestones in software help organize our work on the path to completing a project. They set midway goalposts to which we link new features, bug fixes, and sundry tasks. When used well, they clarify the scope of future work and help us focus our efforts.

## Semantic versioning FYI

In the world of coding, a particular [software release][] is a milestone often communicated through a system known as [semantic versioning][].

For example, we can see that I've installed version `2.25.1` of the Python [requests][] library:

```bash
$ pip freeze | grep requests
requests==2.25.1
```

What are all those numbers and why should you care?

The numbering scheme in [semantic versioning][] signals the level of [compatibility](https://en.wikipedia.org/wiki/Software_versioning#Degree_of_compatibility) of software with prior versions.

* The first number indicates **major** changes that could break code that relied on a previous major version.
* The second signals the addition of **minor** features that are "backwards-compatible".
* And the third number indicates code **patches** such as bug fixes (also backwards-compatible).

Semantic versioning isn't the only way to communicate changes to libraries, but it's a widely used convention and can be helpful when trying to decide which version of a library to install for your project, and whether to update libraries in an existing project.

## Milestones for news apps

Our news apps are of a slightly different nature. We're working on projects that tell a story and enable readers to explore data around a topic.

So unlike coders creating reusable open-source _libraries_, we don't have to worry about communicating the compatibility of our code to the outside world.

> It _is_, however, important to specify "dependencies" -- i.e. the precise versions of software used in our project -- for teammates and others who want to reproduce or build on our work.

Given the different nature of our projects, we can use an alternative approach to set milestones and organize our work. Instead of semantic versioning, we'll peg our milestones to a period of time: the weekly [sprint][].

Yes, this introduces the classic problem of estimating how long a task or feature will take to complete (see XKCD above). But the short time frame for our work -- i.e. units of one week -- lends itself to thinking through granular tasks. These tend to be easier to estimate than broader groups of features on a longer timeline.

Today, we'll review how [Big Local News](https://github.com/biglocalnews) uses [GitHub Milestones][] to organize tasks and code releases for various projects. Then we'll create sprint-based milestones for own team projects and assign our remaining tasks to those mile markers.

[GitHub Milestones]: https://docs.github.com/en/github/managing-your-work-on-github/tracking-the-progress-of-your-work-with-milestones
[semantic versioning]: https://semver.org/
[requests]: https://docs.python-requests.org/en/master/index.html
[software release]: https://en.wikipedia.org/wiki/Software_versioning
[sprint]: https://en.wikipedia.org/wiki/Scrum_Sprint
