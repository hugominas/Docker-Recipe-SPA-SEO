## Info

Docker Boilerplate for request prerender of SPA in React, Angular... It solves the issue of Ajax calls on load and adheres to Chrome Debugging Protocol. Based on [usus](https://raw.githubusercontent.com/gajus/usus/)

## Features

* Renders webpage using the [Chrome Debugging Protocol](https://chromedevtools.github.io/devtools-protocol/) (CDP).
* Extracts CSS used to render the page.
* Renders HTML with the blocking CSS made asynchronous.
* Inlines the critical CSS.
* Preloads CSS and fonts used to render the page using `rel=preload`.


## Use cases

* Produce HTML used to render the page. Used to render single page applications (e.g. React and Angular) to produce a static HTML. This can be used as a replacement of https://prerender.io/. Default behaviour.
* Extract CSS used to render a specific page. Used to capture the critical CSS. Use `--extractStyles` option.
* Produce HTML used to render the page with the critical-path CSS inlined and blocking CSS made asynchronous. Use `--inlineStyles` option.

## How to use

Deploy you docker container and redirect Crawler request to the correct handler with nginx template config. More details soon