#!/bin/bash
# Get latest code from github
sudo git fetch --all && git reset --hard origin/master

# Installs all new modules in package.json and checks for security issues and fix them
sudo npm install
sudo npm update
sudo npm audit fix --force

# Run webpack so that the bundle.js can be created if needed
sudo npx webpack --config webpack.config.js