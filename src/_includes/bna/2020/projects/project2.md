## Final Project: Interactive Graphic with D3

> This project is the last of the two major projects for this quarter. It is due on Tuesday June 4th (the final day of class), during which we'll present our work.

The final project will involve creating an interactive data visualization, publishing the work to your portfolio site, and presenting the project during class. This project is focused on building a custom interactive with D3, in addition to leveraging the tools and skills we've covered over the quarter (e.g. designing on paper, styling with CSS, JS-based interactivity, and deployment using Python).

The goal of the assignment is to focus on the planning and execution of an interactive visualization, so it's important to minimize the amount of time you spend acquiring and preparing data. For example, I would discourage you from writing a complex scraper or a sophisticated data transformation pipeline. Some degree of data preparation may be required to massage data into a form suitable for D3, but you should choose a story and data set(s) that minimize the amount of work on this front. Any code that you write to acquire and/or prepare data for the visualization should be included in your repo and be mentioned in your final presentation.

### Coding requirements

For this project, everyone must use vanilla Javascript and D3 in addition to HTML and CSS -- **other third-party Javascript libraries such as JQuery and React cannot be used.**

Additionally, the data for your application should be loaded from an external file (e.g. JSON or CSV), rather than written into the page (e.g. using a Jinja template).

The code should be built out in an appropriately named directory of your class portfolio site. For example, if it's a project on campaign finance, then your directory tree might look something like this:

```bash
_site/campaign-finance/
├── app.css
├── app.js
└── index.html
```

### Story planning

> Due Tuesday May 21st by start of class

* Identify a story idea and related data set(s).
* Select a primary visual form in which to tell the story (e.g. a map or Sankey diagram). It's also fine to have secondary visual elements, especially if they are folded into interactive elements (e.g. a bar chart that appears on pop-up), but there must be a primary visual element that rendered by D3 on page load.
* Create a paper sketch of the interactive visualization that is supported by the data. It should include visuals and annotations that show the expected behaviors, along with a prominent text area providing narrative background on the interactive to situate the reader.
* Identify key challenges and coding techniques that will be required, and the resources you plan to use to level up if the techniques are new. For example, it's quite likely you'll need to use JS events for the project, so you'll need to hunt down resources such as sections of the [D3.js Quick Start Guide][] or [Cookbook].

[D3.js Quick Start Guide]: https://learning.oreilly.com/library/view/d3js-quick-start/9781789342383/?ar=
[Cookbook]: https://learning.oreilly.com/library/view/data-visualization-with/9781786468253/ 

### Coding

Use HTML, CSS, plain Javascript, D3 and an external data file to implement the interactive visualization. 

> The visualization must include a headline and prominent (but short) section of narrative to provide background on the story.

### Inspiration

#### Data

The search for data in the news process most often begins *after* you've decided on a story idea. Ask yourself if there's a topic or question you'd like to explore -- e.g. something you've seen in the news lately -- and what questions you have about the story. Let those questions guide your data sleuthing.

If you're still hard-pressed for story/data ideas, try visiting government websites and data clearinghouses to generate some ideas.

Below are a few sites to get you started:

* [Palo Alto Data Portal](http://data.cityofpaloalto.org/home/)
* [data.ca.gov](https://data.ca.gov/) - the CA state data portal
* [data.gov](https://www.data.gov/) - a federal clearinghouse of data on a wide variety of subjects
* [San Francisco's online data](https://datasf.org/opendata/) and the underlying [open data portal](https://dev.socrata.com/data/).

Lastly, it's fine to use data sets we've touched on during the quarter, such as the [Death Penalty Information Center's Executions Database](https://deathpenaltyinfo.org/views-executions).

#### Interactives

Below are some interactive graphics and clearinghouses to serve as models and inspiration as you work on the final project. 

Some great [D3 examples from NYT](https://learning.oreilly.com/library/view/d3js-quick-start/9781789342383/1b3f3cbd-66f2-4d42-9530-37e60448db52.xhtml) are mentioned in the D3.js Quick Start Guide. Here are a few:
* [Electoral Map](https://www.nytimes.com/elections/2012/electoral-map.html)
* [512 Paths to the White House](http://archive.nytimes.com/www.nytimes.com/interactive/2012/11/02/us/politics/paths-to-the-white-house.html)
* [Swing States](https://archive.nytimes.com/www.nytimes.com/interactive/2012/10/15/us/politics/swing-history.html)

And some additional examples:

* [Super Bowl Ad-Spending](http://graphics.wsj.com/super-bowl-ad-spending/) by WSJ uses D3 and is a good example for interactive layout/design
* [Thousands Cried for Help as Houston Flooded](https://www.nytimes.com/interactive/2017/08/30/us/houston-flood-rescue-cries-for-help.html) by NYT embeds a dynamic map of tweets in a longer narrative
* [US Minimimum wage growth](https://www.cnn.com/interactive/2019/business/us-minimum-wage-by-year/index.html) - doesn't seem to use d3, but it's a good example of a basic overall page layout with narrative background.
* [Dark Money](https://projects.propublica.org/graphics/koch) by ProPublica doesn't seem to use D3, but is another good example of page elements to use in a news interactive (headline, narrative, interactive chart, etc.).
* [CNN Interactives](https://money.cnn.com/interactive/)
* [WSJ Interactives 2015](http://graphics.wsj.com/wsj-interactives-2015/)

### Submitting your work

To submit the project, you must:

* Deploy it to your portfolio website using our standard `invoke` workflow:
  ```bash
  cd /path/to/portfolio repo
  pipenv shell
  invoke deploy
  invoke cachebust
  ```
* Submit the URL to the published interactive via Canvas

### Final presentation

A 5-10 minute presentation where you:

* Explain the story idea
* Show us your initial design sketches and explain how and why the final implementation differs, if at all
* Demo the interactive
* Discuss technical challenges, what was left on the cutting room floor, and possible improvements given more time

### Grading

Grading will reflect several elements:

* Story and data selection
* Technical planning - how clearly you identify technical challenges/requirements ahead of time
* Visual and interactive planning - the selection of an appropriate visual form and interactive elements, as laid out in the initial sketch
* Execution of the interactive - how well the interactive tells the story, including your choice of headline, narrative text, primary visualization and interactive elements.

It's okay to be ambitious in your designs, and points will not be deducted if you fail to implement every feature you envisioned. However, you should plan your project in a way that allows you to at least build the primary visual, narrative and interactive features. Just as in a newsroom or software shop, have a clear plan for executing a [minimum viable product](https://en.wikipedia.org/wiki/Minimum_viable_product) that can be executed by the deadline.