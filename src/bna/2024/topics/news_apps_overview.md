---
layout: layouts/topics.njk
title: News Apps Overview
description: Brief overview of news apps, with a focus on the COVID era.
tags:
  - topicpages2024
---

The COVID pandemic is arguably the biggest story of our lifetimes. It's affected how we live, work, and learn.

Let's start our exploration of news apps by looking at some examples of news coverage that use data to inform and engage the public around this global story.

In March 2020, The New York Times published a ["scrollytelling" OpEd on flattening the curve](https://www.nytimes.com/interactive/2020/03/13/opinion/coronavirus-trump-response.html) and has been updating a map and related data visualizations on [coronavirus case counts in the U.S.](https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html). The data driving the counts is the product of an ["around-the-clock" operation](https://www.nytimes.com/article/coronavirus-county-data-us.html) by a growing team of journalists and students:

> The tracking effort grew from a handful of Times correspondents to a large team of journalists that includes experts in data and graphics, staff news assistants and freelance reporters, as well as journalism students from Northwestern University, the University of Missouri and the University of Nebraska-Lincoln. The reporting continues nearly all day and night, seven days a week, across U.S. time zones, to record as many details as possible about every case in real time. The Times is committed to collecting as much data as possible in connection with the outbreak and is collaborating with the University of California, Berkeley, on an effort in that state.

The NYT is far from the only news organization marshalling resources around COVID coverage.

The Stanford Daily tracked [Bay Area cases](https://www.stanforddaily.com/2020/03/24/visualized-covid-19-cases-in-santa-clara-county/) in the early days of the pandemic.

[Big Local News][] created an [embeddable map of case counts and vaccinations](http://covid19.biglocalnews.org/county-maps/index.html#/) as a free resource for news outlets that may not have the data or coding expertise to create such a map for their areas.

[Big Local News]: https://biglocalnews.org

At the beginning of the pandemic, Stanford students helped [Big Local News][] create a [map of locations offering free lunches](https://www.mercurynews.com/2020/03/20/map-where-in-the-bay-area-to-get-free-school-lunches-during-coronavirus-closures/) during school closures.

Students, journalists and many others produced information-rich storytelling experiences to keep the public informed during the pandemic. Here's one final example from the New York Times that blends traditional reporting -- interviews and storytelling -- in a multimedia format that includes a variety of data visualizations and information graphics.

<iframe title="New York Times Video - Embed Player" width="480" height="321" frameborder="0" scrolling="no" allowfullscreen="true" marginheight="0" marginwidth="0" id="nyt_video_player" src="https://www.nytimes.com/video/players/offsite/index.html?videoId=100000007056651"></iframe>

## News apps, broadly defined

News applications have a rich and long history (okay, about 15-20 years).

Early news apps typically involved a dynamic, database-backed web application with a more user-friendly interface. They often allowed basic search alongside the ability to "drill down" through pages to explore detailed data about sports, congressional votes, and other data.

The advent of web frameworks such as [Django](https://www.djangoproject.com/) and [Rails](https://rubyonrails.org/) sped up this trend. Newsrooms realized they could easily provide public access to databases traditionally used for in-house research and analysis.

The more ambitious added visual components and auto-generated narrative alongside the data; the less ambitious provided little more than a thin veneer over raw public databases. Think mugshots or government employee salaries. These latter "apps", devoid of any narrative or visual storytelling elements, came to be known as the dreaded "database ghetto": designed as little more than an opportunity for voyeurism and generating page views.

Fortunately, the landscape has evolved since those early days. Newsrooms are spending more time thinking about how to engage the public and even [enlist them](https://www.theguardian.com/news/datablog/2009/jun/18/mps-expenses-houseofcommons) in the news process. They're building [storybots](https://source.opennews.org/articles/how-break-news-while-you-sleep/) to speed up the responsiveness of news, and using [interactive games](https://projects.propublica.org/asylum/) and [AR/VR](https://docs.google.com/presentation/d/1-F_eyqTcKhXb6k2f3KzcwA_Wmy2QQkq39v5cUXTLTr8/present#slide=id.g356b11cd76_0_0) to provide new story experiences.

They're tapping into [satellite imagery][] and ocean [tide sensors][] -- or even [building their own sensors][] -- to uncover the news. They're building [tools](https://docs.datasette.io/en/stable/) and [platforms](https://www.documentcloud.org/) to support the news gathering and publication process.

[story bots]: https://source.opennews.org/articles/how-break-news-while-you-sleep/
[satellite imagery]: https://www.revealnews.org/article/who-is-the-wet-prince-of-bel-air-here-are-the-likely-culprits/
[tide sensors]: https://www.reuters.com/investigates/special-report/waters-edge-the-crisis-of-rising-sea-levels/#gauges-interactive
[building their own sensors]: https://current.org/2016/07/wnycs-latest-sensor-journalism-project-zeroes-in-on-heat-island-harlem/

As news app developers or, more broadly, data journalists, we have the ability to restore some of the trust that has been lost in news. For starters, we can apply best practices from the scientific and open source communities to increase trust in our process. Many news organizations already publish [detailed methodologies](https://www.revealnews.org/article/how-we-identified-lending-disparities-in-federal-mortgage-data/) on their work alongside major investigations. And a growing number publish the raw data and [code](https://github.com/datadesk) used in analysis, tools and applications.

In this course, we'll adopt a broad definition of news apps as the convergence of code, design and journalism -- all in pursuit of engaging the public in new and interesting ways and sustaining the mission of public accountability journalism.

