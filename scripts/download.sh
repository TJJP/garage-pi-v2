sudo git clone https://github.com/TJJP/garage-pi-v3.git
cd ./garage-pi-v3
npm install
sudo npx webpack --config webpack.config.js
sudo nano ecosystem.config.js
sudo su
sudo npm i -g pm2
exit
cd ./garage-pi-v2
sudo pm2 startup
sudo pm2 start ecosystem.config.js
sudo su
curl -fsSL https://get.telebit.io/ | bash
~/telebit http 7119
