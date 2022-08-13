# arm32v7/node:11-slim is used because hypriot/rpi-node is deprecated
# Node v11 is used because rpio is not yet working with node v12
# Slim is used to keep the size of the image as small as possible
FROM arm32v6/node:14-alpine

# This is where the garage-pi code will be placed
RUN mkdir /code
WORKDIR /code

# Copy over everything into the container
COPY . /code

# Install
RUN apk update
RUN apk add sudo
RUN apk add curl
RUN sudo ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime
RUN sudo apk add tzdata
RUN sudo apk add nano
# RUN sudo apk add --no-cache cron
RUN sudo apk add certbot
RUN sudo apk add py3-setuptools
RUN sudo apk add build-base
RUN sudo npm install rpio
RUN sudo apk add git
RUN sudo npm install
RUN sudo npm audit fix
RUN sudo npx webpack --config webpack.config.js


CMD ["npm", "start"]