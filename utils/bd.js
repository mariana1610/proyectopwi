const mysql = require('mysql'); // modulo de mysql
const util = require('util');

//crea conexiones en paralelo, no como create connection
const pool = mysql.createPool({
    host : process.env.HOST_DB,
    port : process.env.PORT_DB,
    user : process.env.USER_DB,
    password : process.env.PASSWORD_DB,
    database : process.env.DATABASE,
    connectionLimit : 10
})
//referencia de conexion

pool.query = util.promisify(pool.query);
// pool query soporta async await con esto
module.exports = pool; //exportar pool para poder usarlo en cualquier archivo

