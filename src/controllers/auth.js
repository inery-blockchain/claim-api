const jwt = require('jsonwebtoken');

module.exports = {
	check : (req, res, next) => {
		if(req.headers.authorization === undefined) res.status(503).json({error : "unauthorized"})
		else{
            let token = req.headers.authorization;
			jwt.verify(token, process.env.JWT_SECRET, (err, decoded)=> {
				if(err || decoded === undefined){
					res.status(503).json({error : "unauthorized"})
				}else{
					res.decoded = decoded;
					req.decoded = decoded;
					next();
				}
			});
		}
	}
}