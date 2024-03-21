# arm32v6/node:18-alpine is used because hypriot/rpi-node is deprecated
# Alpine is used to keep the size of the image as small as possible
# arm32v6 is used so it works on raspberry pi zero W
FROM arm32v6/node:20-alpine

# This is where the garage-pi code will be placed
RUN mkdir /app
WORKDIR /app

# Copy over everything into the container
COPY . /app

# Install
RUN apk add --update bash
RUN sh ./scripts/install.sh

# Expose Port
EXPOSE 7119

# Run server
CMD ["npm", "start"]
