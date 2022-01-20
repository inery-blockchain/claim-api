const auth = require("./controllers/auth");
const bodyParser = require("body-parser");
const whitelist = require("./controllers/whitelist");

let jsonParser = bodyParser.json({ limit: "10mb", extended: true });

module.exports = (app) => {
  
    app.post(
        "/whitelist/checkWalletAddress",
        jsonParser,
        auth.check,
        whitelist.checkWalletAddressBEP20
      );

};
