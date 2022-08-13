#!/bin/bash
#Script runs in docker container
#start at root of code
cd /code
# refreshing the repositories
apk update

# install sudo
apk add sudo 

# Time settings
apk add curl
sudo ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime
sudo apk add tzdata

# install nano for crontab editing
sudo apk add nano

#Install certbot and cron
sudo apk add cron
sudo apk add certbot

# Python and pip
# This is the biggest part and takes a long time...
# Needed to install node-gyp which is needed for rpio
# Without rpio this project doesn't work
sudo apk add python-setuptools
sudo apk add build-essential
sudo npm install make
sudo npm install rpio

# git used for updating
sudo apk add git

# Installs all modules in package.json and checks for security issues and fix them
sudo npm install
sudo npm audit fix

# Run webpack so that the bundle.js can be created
sudo npx webpack --config webpack.config.js
