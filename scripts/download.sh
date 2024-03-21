#!/bin/bash
#To be run by user that just wants to download the docker container
sudo docker run -v /etc/timezone:/etc/timezone --restart=always --device=/dev/mem:/dev/mem --name=garage-pi --privileged --publish 7119:7119 -d tjjp/garage-pi-v3:latest

# add to crontab
#get current cron
sudo crontab -l >cron_c
#add new lines
echo "0 2 * * 3 sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --run-once" >>cron_c
#remove duplicates
sort -u cron_c >cron_n
#install new cron
sudo crontab cron_n

# restasrt the docker container
sudo docker container restart garage-pi