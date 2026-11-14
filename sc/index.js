const express = require('express');
const mongoose = require('mongoose');

 const { Pool } = require('pg');


const app = express();
const port = 4000;





const DB_user = 'root';
const DB_Password = 'example';
const DB_port = 5432;
const DB_host = 'postgres';


const pool = new Pool({
  user: DB_user,
  password: DB_Password,
  host: DB_host,
  port: DB_port,

});

pool.connect()
  .then(() => console.log('connect to db...'))
  .catch((err) => console.log('failed to connect to db: ', err));

// الصفحة الرئيسية
app.get('/', (req, res) => res.send('<h1>Hello this is Devvvv   </h1>'));

// route بـ parameter: /hello/ahmed
app.get('/hello/:name', (req, res) => {
  res.send(`<h1>Hello ${req.params.name}</h1>`);
});

// route بيرجع JSON
app.get('/api/info', (req, res) => {
  res.json({ name: 'Magdi', message: 'server is running' });
});

// route بسيط لتجربة Redis
app.get('/test-redis', async (req, res) => {
  await redisClient.set('greeting', 'Hello from Redis');
  const value = await redisClient.get('greeting');
  res.send(value);
});

app.listen(port, () => console.log(`app is up and running on port: ${port}`));
