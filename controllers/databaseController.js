'use strict';

const fs = require('fs');
checkDatabases(); //Need to check before running the server for the first time

//Check to see if the databases exist. They wont exist if this is the first time running.
function checkDatabases(){
	if(!fs.existsSync('./databases')){ //Create the databases if they don't exist
		fs.mkdir('./databases', { recursive: true }, (err) => {
			console.error(err);
			throw err;			
		});
		var files = ['logs.json','notification.json','pins.json','timer.json','users.json'];
		files.forEach(element => { 

			const filemveo = fs.copyFile('./sample-databases/'+element, './databases/'+element, err => {
				console.error(err);
				throw err;
			});
		});
	}
}

module.exports = {checkDatabases}