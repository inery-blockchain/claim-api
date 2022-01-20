require('dotenv').config();
const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const app = express();

global.server = require('http').createServer(app);

const routes = require('./src/routes');

app.use(helmet());
app.use(cors());

routes(app)

global.server.listen(4000);