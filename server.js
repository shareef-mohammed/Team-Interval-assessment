require('dotenv').config()
const express = require('express');
const morgan = require('morgan');
const db = require('./connectdb/connectdb')

db.connect((err) => {
    if(err) {
        throw err
    }
    console.log('MySql connected.')
});

const app = express();

const articleRouter = require('./routes/articleRouter');

app.use(express.json());
app.use(morgan('dev'));

app.use('/', articleRouter);

app.listen(process.env.PORT, () => {
    console.log('Listening to the server.')
})