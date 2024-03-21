#!/bin/bash
#To be run by user that just wants to download the docker container
curl -sSL https://get.docker.com | sh
sudo docker run -v /etc/timezone:/etc/timezone --restart=always --device=/dev/mem:/dev/mem --name=garage-pi --privileged --publish 7119:7119-d tjjp/garage-pi-v3
sudo crontab -l 2>/dev/null; echo -e  "0 2 * * 3 sudo docker exec -t garage-pi /app/scripts/update.sh && sudo docker container restart garage-pi >/dev/null 2>&1" | sudo crontab -
sudo docker container restart garage-pi