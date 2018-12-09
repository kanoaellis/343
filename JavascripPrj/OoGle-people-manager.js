// The API toolkit for making REST systems easily
const express = require('express');
// A good solution for handling JSON data in routes
const bodyParser = require('body-parser');
// Node JS modules for filesystem access
const fs = require('fs');
// Our database connection
// This will be a JSON object of our programmers
// and can be accessed as if it was any other javascript
// object
const database = require('./programmers.json');

//Create an array to hold elements of database
const dbArr = [database];
const dbKey = Object.keys(database);

// Make an instance of our express application
const app = express();
// Specify our > 1024 port to run on
const port = 3000;

// Apply our middleware so our code can natively handle JSON easily
app.use(bodyParser.json());

// We must have our list of programmers to use
if (!fs.existsSync('./programmers.json')) {
	throw new Error('Could not find database of programmers!');
}

// Build our routes

app.get('/', (req, res) => {
		res.send(dbArr);
		});

app.get('/:id', (req, res) => {
		const id = req.params.id;
		var list = [];
		dbArr.forEach(i => {
				if(i.SID === id){
				list.push(i);
				}
				});
		//If ID not found, send Not Found
		if(list.length == 0){
		res.sendStatus(404);
		} else {
		res.send(list);
		}
		});

app.put('/:id', (req, res) => {
		const id = req.params.id;
		const body = req.body;
		const bodyKey = Object.keys(body);

		data.forEach(k => {
				if(k.SID === id){
				data.splice(k,1);
				}
				});
		let data = {};
		dataKey.forEach(key => {
				if(body[key]){
				data[key] = body[key];
				} else {
				data[key] = "";
				}
				});
		dbArr.push(data);
		res.send(`Fill me in to update values with ID: ${id}`);
		});

app.post('/', (req, res) => {
		const body = req.body; // Hold your JSON in here!
		console.log(req.body);
		dbArr[req.body.name] = req.body;
		console.log(dbArr);
		res.send(`You sent: ${body}`);
		});

// IMPLEMENT A ROUTE TO HANDLE ALL OTHER ROUTES AND RETURN AN ERROR MESSAGE
app.all('*',(req, res) => {
		res.sendStatus(403);
		});

app.listen(port, () => {
		console.log(`She's alive on port ${port}`);
		});
