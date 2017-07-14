import path from 'path';
import express from 'express';
import cors from 'cors';
import PrettyError from 'pretty-error';

const app = express();

app.set('trust proxy', 'loopback');

app.use(cors({
  origin(origin, cb) {
    const whitelist = process.env.CORS_ORIGIN ? process.env.CORS_ORIGIN.split(',') : [];
    cb(null, whitelist.includes(origin));
  },
  credentials: true
}));

const pe = new PrettyError();
pe.skipNodeFiles();
pe.skipPackage('express');

app.use((err, req, res, next) => {
  process.stderr.write(pe.render(err));
  next();
});

app.get('/', (req, res) => {
  console.log('REQUESTING ROOT');
  res.send('<p>Hello Kegbots!</p>');
});

export default app;
