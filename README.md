BTK - Bootstrap Templating kit
==============================

## Magnolia version ##
Developed on Magnolia 5.4.9, suggested to use with 5.5+

## Navigation ##
Default Navigation using 'navfn' which is part of MTK and MTE 2.0 (in Magnolia 5.5), to make navigation working without 'navfn' edit:
`/btk/templates/areas/navbar.ftl`
and change lines #15, #16 to include 'navigation.ftl'.

## Sample content / demo page ##
To see sample pages manual import is required, please import all  .xml files from:
`/btk/_do-manually/bootstrap-samples`






# Bootstrap Framework #
BTK is build to work with Bootstrap Framework (www.getbootstrap.com) and all components using class names which Bootstrap Framework defines.
It does already contain and use default bootstrap.css, bootstrap.js and glyphicons.
But also source code (scss) for recompiling bootstrap.css and .js any time, all of them are in '/btk/webresources-sources' folder. Of course we strongly recommend to do it locally in development environment and then just distribute final resources which should be generated into '/btk/webresources' folder.
There is many ways ho to recompile Bootstrap resources, for example with gulp, grunt and other tools. Bellow is an example how to do it just with with 'node-sass' and 'uglifyjs'.

## Example of recompiling: ##
We expect you have Nodejs installed because you probably get this light module from npm repository, if not pls check and install https://nodejs.org/en/.
For recompiling you will need another two libraries:
* **node-sass** allow to compile SCSS files to CSS, create source-maps, optionally you can minify output files ( --output-style=compressed )
* **UglifyJS2** concatenate, minify and create source maps for javascript files

Just install both by run this command in Terminal (as an Administrator)
```
npm install -g node-sass uglify-js
```

### To compile SCSS files to CSS with source map, in '/btk/webresources-sources/scss' run: ###
```
node-sass --source-map=true -o ../webresources/css scss/*.scss
```

### To concat and compress javascript files with source map, in '/btk/webresources-sources/js' run: ###
```
uglifyjs js/bootstrap/*.js -o ../webresources/js/bootstrap.min.js --source-map ../webresources/js/bootstrap.js.map
```
