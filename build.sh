#!/bin/sh
ARCHITECTURE=$(uname -m)
ROOT_PATH=$(pwd | grep -o 'Docker/[a-zA-Z0-9-_]+' | sed 's/Docker\///g')

if [ "$ARCHITECTURE" = "x86_64" ]; 
  then
    DOCKERFILE_PATH=Dockerfile-x86
  else 
    ~/Dropbox-Uploader/dropbox_uploader.sh download Development/Docker/$ROOT_PATH .. > dropbox-download.log
    DOCKERFILE_PATH=Dockerfile-$ARCHITECTURE
fi

PACKAGE_NAME=$(grep '"name":' package.json | sed 's/[ \t]*"name":[ \t]*"//g' | sed 's/",[ \t\n]*//g')
PACKAGE_VERSION=$(grep '"version":' package.json | sed 's/[ \t]*"version":[ \t]*"//g' | sed 's/",[ \t\n]*//g')

echo "------------------------------------------------------------------------"
echo "-- Build:       $PACKAGE_NAME"
echo "-- Version:     $PACKAGE_VERSION"
echo "-- Root path:   $ROOT_PATH"
echo "------------------------------------------------------------------------"
echo "-- Dockerfile:  $DOCKERFILE_PATH"
echo "-- Arch.:       $ARCHITECTURE"
echo "------------------------------------------------------------------------"

docker build -f $DOCKERFILE_PATH -t $PACKAGE_NAME:$PACKAGE_VERSION -t $PACKAGE_NAME:latest .
docker images $PACKAGE_NAME

