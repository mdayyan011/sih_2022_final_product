
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const DataRouter = require('./routes/routes.js');
const cors = require('cors'); 

app.use(bodyParser.json());

app.use(cors());  

app.use('/api', DataRouter);

app.get('/', (req, res) => {
  res.send('Hello SIH!');
});
app.listen('1230', function (req, res) {
  console.log('Server started at port 1230');
});
