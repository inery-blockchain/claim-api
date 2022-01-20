require('dotenv').config();
const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const app = express();
const fs = require("fs");

var options = {
    key: fs.readFileSync(process.env.SSL_KEY),
    cert: fs.readFileSync(
        process.env.SSL_CERT
    ),
};

global.server = require("https").createServer(options, app);

const routes = require('./src/routes');

app.use(helmet());
app.use(cors());

routes(app)

global.server.listen(process.env.PORT);