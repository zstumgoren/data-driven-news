---
layout: layouts/topics.njk
title: Getting on the Web
description: How to Publish Code to the Web
tags:
  - topicpages2022
---


<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vSJkVE397GZ-EuGycXWDTA04eP1gktNt3fyqIDW5nyvsu4nuU5BQdCPuP1nvKyfj0WcBdtHfGgholJO/embed?start=false&loop=false&delayms=3000" frameborder="0" width="100%" height="400" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

## Overview

So you've spent weeks crafting a fancy new interactive web project. Now you're ready to get it off your laptop and share it with the world.  Where to begin?

The sheer variety of platforms and strategies for deploying a site can leave your head spinning.

Today we'll briefly review some considerations when deciding on how to deploy an interactive graphic or website. We'll discuss the pros and cons of different strategies and platforms before kicking the tires on [GitHub Pages](https://pages.github.com/), which is a free and easy-to-use option that is a solid first choice for web hosting.

## GitHub Pages setup

Each team should migrate their project repository to a new GitHub [organization](https://docs.github.com/en/organizations). Using an organization account to host each team's site allows us to avoid tying the URL of the project to the personal account of any one team member, and gives us the opportunity to choose a short but meaningful name that will help customize our website.

When creating a new organization, pick a short but meaningful name that clearly communicates the nature of your project. This name will also appear in the subdomain of your project. For example, an organization called `SuperfundSearch` will end up with the following GitHub Pages URL: https://superfundsearch.github.io

Here are a few other steps to follow:

* One person from each team should create a new GitHub organization. During this process, you'll be asked if you have an existing repository for this organization. If you plan to transfer the repository, choose `Yes`. If you want to create a brand new repository, choose `No`.
* Name the **repository** (or rename it after [transferring the repo][]) based on the the following convention: `<orgname>.github.io`, where `<orgname>` **exactly matches** the Organization name and is lower case.
* Add your teammates and me as members of the new organization.
* Go to the the `Settings` tab of the repository
* If the repo is private, go to the bottom of the `Settings` page and
change it to public by clicking `Change visibility`
* Go to the `Pages` section listed in the navigation on left
* Configure the `Source` field to use the `main` branch and to serve from the `/ (root)` of the repository. Click `Save`.
* Verify the site is live by clicking the link at it's published address.

> Note: If you get a 404, wait a minute or two and refresh. It can take some time for the new site to appear. If it doesn't appear after a few minutes, you may need to double-check that the name of the repo follows the pattern described above.


[transferring the repo]: https://docs.github.com/en/repositories/creating-and-managing-repositories/transferring-a-repository

With the above setup, the "entry point" to your site (e.g.  `index.html`), should go in the root of the repository.

Further, this makes `main` your "production" branch. Any code pushed to or merged into `main` will be live to the world. If you'd prefer to use an alternative branch to serve your website (e.g.  a branch called `production`), that's fine as well. Some folks prefer that approach since it leaves `main` free for use as the team's primary workspace (though you *are* developing on branches, right?).
