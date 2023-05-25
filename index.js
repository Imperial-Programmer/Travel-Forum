import express from "express";
import router from "./routes/routes.js";
import path from "path";
import { fileURLToPath } from 'url';
import session from 'express-session';
import flash from 'connect-flash';
import ejs from "ejs";

// init express
const app = express();

const __filename = fileURLToPath(import.meta.url);

const __dirname = path.dirname(__filename);

//set dynamic views file
app.set('views', path.join(__dirname, 'views'));
//set view engine
app.set('view engine', 'ejs');
//set public folder as static folder for static file
app.use(express.static('public'));

app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(flash());

// Use Router
app.use(router);

// listen on port
app.listen(3000, () => console.log('Server Running at http://localhost:3000'));