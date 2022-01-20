const whitelist_mod = require('../models/whitelist_mod');

module.exports = {

	checkWalletAddressBEP20 : async (req, res) => {
		try {
			let wallet_address = req.body.wallet_address;

            if( wallet_address != null && wallet_address != "" )
		    {
				let rounds = await whitelist_mod.getAllRoundsWhereIsWalletAddress(wallet_address).catch(reason => { throw reason });

				res.status(201).json({ status: 1, data: { rounds }, developerMessage: "", errorMessage: "", errors: [] });
			}
			else {
				res.status(422).json({status:2, data:{}, developerMessage:"Please enter wallet address", errorMessage:"Please enter wallet address", errors:[]});
			}
		} catch(err) {
			res.status(400).json({status:0, data:{}, developerMessage:"", errorMessage:"", errors:[err]})
		}
	}
}