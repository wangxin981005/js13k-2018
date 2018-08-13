#!/bin/bash

zipfile="js13k.zip"
buildpath="build"
jscat="${buildpath}/min.js"

# Create clean build folder
rm -Rf "${buildpath}" >/dev/null 2>&1
rm -Rf "${zipfile}"
mkdir "${buildpath}"

# Concatenate the JS files
touch "${jscat}"
for file in random.js dtmf.js font.js main.js
do
  yui-compressor "${file}" >> "${jscat}"
done

# Copy in the index file
cp index.html "${buildpath}/"

# Zip everything up
zip -j ${zipfile} "${buildpath}"/*

# Determine file sizes and compression
unzip -lv "${zipfile}"
stat "${zipfile}"
