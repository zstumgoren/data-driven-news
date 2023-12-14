---
layout: layouts/topics.njk
title: The Coding Cockpit and JS Exercise
description: Manipulating the DOM with JS and using browser developer tools
tags:
  - topicpages2024
---

![cockpit](/static/img/nasa-cockpit.jpg)

## Overview

To the untrained eye, a cockpit dashboard is a head-spinning array of gauges and dials. To a pilot, the dashboard is a vital window into the surrounding environment and status of a hurtling tube of metal.

Yes, programming is typically a far less risky endeavor, but we too need visibility into the workings of the machine.

When coding for the web, the browser's [developer toolbar][] is your cockpit dashboard. It provides a window into how the code is - or is not - working. It lets you view the effects of changes, expose and debug errors, and experiment with different solutions.

If you're new to a language or technique, it may require research to figure out one or more ways to gain visibility into the code. You might use `console.log` in Javascript, or a [Python debugger][] in a web scraper. The tools and strategies will vary by context, but the overarching question remains the same: How do you get visibility into what's happening in the code?

Discovering and building fluency in these tools can be *as important as learning the syntax of a language.* In fact, these tools can help in the process of learning a language.

## JS Exercise with Dev Tools

Let's put in a few reps getting comfortable with how Javascript can be used to dynamically update the Document Object Model, the data representation of a web page. We'll work through a [basic exercise][] and review some features of the [developer toolbar][] along the way.

## Reference

- [W3Schools Javascript HTML DOM](https://www.w3schools.com/js/js_htmldom.asp)
- [Manipulating Documents](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Client-side_web_APIs/Manipulating_documents)
- [What are browser Developer Tools](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_are_browser_developer_tools)

[basic exercise]: https://github.com/zstumgoren/js-exercises
[developer toolbar]: https://developer.mozilla.org/en-US/docs/Tools
[Python debugger]: https://pypi.org/project/ipdb/
