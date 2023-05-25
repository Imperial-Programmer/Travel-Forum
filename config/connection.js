import mysql from 'mysql';

// init connection from mysql
const Connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'travel'
});


export { Connection }
