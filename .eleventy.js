const pluginTOC = require('eleventy-plugin-nesting-toc');
const syntaxHighlightPlugin = require("@11ty/eleventy-plugin-syntaxhighlight");

module.exports = function(eleventyConfig) {
  eleventyConfig.addPlugin(
    pluginTOC,
    {tags: ['h2', 'h3'], wrapper: "aside"}
  );
  eleventyConfig.addPlugin(syntaxHighlightPlugin);

  eleventyConfig.addPassthroughCopy("src/static/css");
  eleventyConfig.addPassthroughCopy("src/static/img");
  //eleventyConfig.addPassthroughCopy("src/static/pdf");

	/* Markdown */
	let markdownIt = require("markdown-it");
	let markdownItAnchor = require("markdown-it-anchor");
	let options = {
		html: true,
		breaks: true,
		linkify: true
	};
	let opts = {
    permalink: false,
		slugify: function(s) {
			let newStr = String(s).replace(/New\ in\ v\d+\.\d+\.\d+/, '');
			newStr = newStr.replace(/⚠️/g, '');
			newStr = newStr.replace(/[?!]/g, '');
			return encodeURIComponent(newStr.trim().toLowerCase().replace(/\s+/g, '-'));
		},
		permalinkClass: "direct-link",
		level: [1,2,3]
	};

	eleventyConfig.setLibrary("md", markdownIt(options)
		.use(markdownItAnchor, opts)
	);

  return {
    templateFormats: [
      "md",
      "njk",
      "html",
      "liquid"
    ],
    pathPrefix: "/",
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
    dataTemplateEngine: "njk",
    passthroughFileCopy: true,
    dir: {
      input: "src",
      includes: "_includes",
      data: "_data",
      output: "_site"
    }
  };
};
