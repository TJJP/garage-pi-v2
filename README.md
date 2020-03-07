# garage-pi-v3

!!!!!!!!!!!!!STILL IN NOT COMPLETE THE SETUP WILL NOT RUN.!!!!!!!!!!!!!!!

Control your garage door using a web application running on your Raspberry Pi.

## Compatibility
### Hardware
- [x] Raspberry Pi 2 Model B 
- [x] Raspberry Pi  2 Model B v1.2 
- [x] Raspberry Pi 3 Model B
- [x] Rasberry Pi 3 Model B+
- [x] Rasberry Pi 4 Model B

### Rasbian Version
- [x] Stretch
- [x] Buster


## Setup for V3

### Wiring
You can find the [original setup instructions on howchoo](https://howchoo.com/g/yznmzmuxywu/how-to-control-your-garage-door-from-your-phone-using-a-raspberry-pi). These instructions will show you how to wire your Pi and how to install the original Garage-Pi.
**Use only for wiring instructions**

   - The open sensor, close sensor, and relay can be wired to the following physical pins:
       - 3, 5, 7, 8, 10, 11, 12, 13, 15, 16, 18, 19, 21, 22, 23, 24, 26, 29, 31, 32, 33, 35, 36, 37, 38, 40.
       - These are physical pins of the Raspberry Pi
![alt text](https://www.bigmessowires.com/wp-content/uploads/2018/05/Raspberry-GPIO.jpg "Physical Pinout Diagram")

### Setup Rasbian
You can find instuctions on [How to set up your Raspberry Pi without a keyboard, monitor, or mouse on howchoo](https://howchoo.com/g/mzgzy2mwowj/how-to-set-up-raspberry-pi-without-keyboard-monitor-mouse).

### NO port forwarding!!!
This project does not need to have port fowarding to work! It uses telebit!

### Install Garage-Pi-v3 From Repository (faster)
1. Open up a terminal
1. ssh into your Pi
   - ```ssh pi@192.168.1.1```
   - Use the IP address of your Pi
   - default password is "raspberry"
1. Garage-Pi & pm2 & telebit by running
   - ```bash <(curl -s https://raw.githubusercontent.com/TJJP/garage-pi-v3/master/scripts/download.sh)```

   
## First Time Use
1. Open a web browser to the domain you setup
   - You should notice that a http address should redirect to a https address
1. Follow the onscreen instructions to create your first user
1. After logging in, click the setting to add users, delete users, change your password, setup your Amazon Alexa or Google Assistant, adjust the logs, etc.


## TODO
- [ ] Only allow admin user to delete other users (first user is considered admin)
- [ ] Add PWA components for iOS compatibility
- [ ] Allow for multiple garage door openers
- [ ] Change Log to Calendar View for easier viewing of logs
- [ ] Keep logs by the day/week/month
- [ ] Consider logs be kept in database if there are going to be so much more of them

## Acknowledgements
* Original Garage-Pi Created by Tyler Jones at Howchoo.com and on Github
* Favicon made by Freepik from [www.flaticon.com](www.flaticon.com) is licensed by CC 3.0 BY
