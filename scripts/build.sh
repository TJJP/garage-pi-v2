#!/bin/bash
#To be run by a user building the docker container
print_help () {
	echo "usage: build.sh [options]"
	echo "	options:"
	echo "		-d, --distro		Create a Garage-Pi-v3 image for distribution"
	echo "		-h, --help		Display this help message"
	echo "		-s, --setup		Setup Garage-Pi-v3"
	echo "		-n, --no-cert		Setup Garage-Pi-v3 without certificates"
}

build (){
	cd ./garage-pi-v3
	sudo docker build -t tjjp/garage-pi-v3 .
}

setup (){
	sudo docker run -v /etc/timezone:/etc/timezone --restart=always --device=/dev/mem:/dev/mem --name=garage-pi --privileged --publish 7119:7119 -d tjjp/garage-pi-v3
	sudo crontab -l 2>/dev/null; echo -e  "0 2 * * 3 sudo docker exec -t garage-pi /code/scripts/update.sh && sudo docker container restart garage-pi >/dev/null 2>&1" | sudo crontab -
	sudo docker container restart garage-pi
}

verify (){
	read -p "Are you sure?" -n 1 -r
	echo    # (optional) move to a new line
	if [[ ! $REPLY =~ ^[Yy]$ ]]
		then
			[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
	fi
}

if [ $# -eq 0 ]
	then
    	print_help
		exit 0
fi

if [ "$1" == "--help" ] || [ "$1" == "-h" ]
	then
		print_help
		exit 0
fi

if [ "$1" == "-distro" ] || [ "$1" == "-d" ]
	then
		verify
		build
		exit 0
fi

if [ "$1" == "--setup" ] || [ "$1" == "-s" ]
	then
		verify
		build
		setup
		exit 0
fi

if [ "$1" == "--no-cert" ] || [ "$1" == "-n" ]
	then
		echo "You will have to import your own certs to the docker containers /code/tls folder"
		verify
		build
		sudo docker run -v /etc/timezone:/etc/timezone --restart=always --device=/dev/mem:/dev/mem --name=garage-pi --privileged --publish 443:443 --publish 80:80 -d tjjp/garage-pi-v3
		exit 0
fi
