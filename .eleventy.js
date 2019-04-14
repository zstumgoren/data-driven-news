module.exports = function(eleventyConfig) {

  eleventyConfig.addPassthroughCopy("css");

  return {
    templateFormats: [
      "md",
      "njk",
      "html",
      "liquid"
    ],
    pathPrefix: "/",
    markdownTemplateEngine: "liquid",
    htmlTemplateEngine: "njk",
    dataTemplateEngine: "njk",
    passthroughFileCopy: true,
    dir: {
      input: ".",
      includes: "_includes",
      data: "_data",
      output: "_site"
    }
  };
};
