#!/bin/sh
# Script runs in docker container
# Start at root of code
cd /code

# update repositories
apk update

# install sudo
apk add sudo

# Time settings
sudo apk add curl
sudo ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime
sudo apk add tzdata

# install nano for crontab editing
sudo apk add nano

# Python and pip
# This is the biggest part and takes a long time...
# Needed to install node-gyp which is needed for rpio
# Without rpio this project doesn't work
sudo apk add py3-setuptools
sudo apk add build-base
sudo npm install rpio

# git is used for updating
sudo apk add git

# Installs all modules in package.json and checks for security issues and fixes them
sudo npm install
sudo npm audit fix
sudo npx webpack --config webpack.config.js