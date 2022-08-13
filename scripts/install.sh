#!/bin/bash
#Script runs in docker container
#start at root of code
cd /code
# refreshing the repositories
apk update

# install sudo
apk add sudo -f

# Time settings
apk add curl -f
sudo ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime
sudo apk add tzdata -f

# install nano for crontab editing
sudo apk add nano -f

#Install certbot and cron
sudo apk add cron -f
sudo apk add certbot -f

# Python and pip
# This is the biggest part and takes a long time...
# Needed to install node-gyp which is needed for rpio
# Without rpio this project doesn't work
sudo apk add python-setuptools -f
sudo apk add build-essential -f
sudo npm install rpio

# git used for updating
sudo apk add git -f

# Installs all modules in package.json and checks for security issues and fix them
sudo npm install
sudo npm audit fix

# Run webpack so that the bundle.js can be created
sudo npx webpack --config webpack.config.js
