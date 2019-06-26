# Front-End Web Stack

Rather than clutter my machine with a bunch of web tools, I use this as a base.

## Current Web Tools Installed
* npm
* yarn
* grunt
* less
* jshint
* uglify-js
* scss
* webpack
* webpack-cli
* @angular/cli

RUN npm install -g grunt less jshint uglify-js webpack webpack-dev-server webpack-cli @angular/cli

## To-Do
* ~~Include Sass CSS~~

## Usage
A quick script to use this image
```bash
#!/bin/sh
docker run -it --rm -v $(pwd):/opt/app funayman/webtools $@
```
