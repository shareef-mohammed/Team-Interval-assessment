const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: process.env.USER_NAME,
    password: process.env.PASSWORD,
    database: 'articles_db'
});

module.exports = db