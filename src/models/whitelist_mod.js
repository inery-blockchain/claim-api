const mysql = require('mysql');
const mysql_con = require('../db/mysql');
const { db } = mysql_con;

module.exports = {

    getAllRoundsWhereIsWalletAddress: (wallet_address) => {
		return new Promise(async (resolve, reject)=>{
            db.query('SELECT id, amount, round_name_id, ( SELECT name FROM round_names WHERE round_names.id = whitelists.round_name_id ) as round_name FROM whitelists WHERE wallet_address = ' + mysql.escape(wallet_address), async (err, res) => {
                if(err) {
                    reject({
                        status: -1,
                        msg: "Internal Error - Unable to get rounds list",
                        devMsg: err
                    });
                } else {

                    let rounds = [];

                    if( res.length > 0 ) {
                        for( let i=0; i< res.length; i++) {

                            rounds.push( { wallet_address, amount: res[i].amount, round_name_id: res[i].round_name_id, round_name: res[i].round_name  } );
                        }
                    }

                    resolve(rounds)
                }	
            })
		})			
    }

}