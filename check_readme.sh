#! /bin/bash

if [ ! $VERSION_PATH ]; then
  VERSION_PATH="lib/$PROJECT/version.rb"
fi

if [ ! $GEM_NAME ]; then
  GEM_NAME=$PROJECT
fi

VERSION=$(grep VERSION $VERSION_PATH  | sed -e "s/.*'\(.*\)'/\1/g")

grep https://www.rubydoc.info/gems/$GEM_NAME/$VERSION README.md
