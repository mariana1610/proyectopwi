var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const dotenv = require("dotenv");
dotenv.config();

const indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const home = require('./routes/home');
const about = require('./routes/about');
const contacto = require('./routes/contacto');
const productos = require('./routes/productos');
const recetas = require('./routes/recetas');
const producto = require('./routes/producto');
const login = require('./routes/login');
// Categorias
const tortas = require('./routes/tortas'); 
const chocolateria = require('./routes/chocolateria'); 
const panaderia = require('./routes/panaderia'); 
const cajas = require('./routes/cajas'); 
const pascuas = require('./routes/pascuas'); 
const especiales = require('./routes/especiales'); 
// Admin
const adminproducto = require('./routes/admin/adminproducto');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/home', home);
app.use('/about', about);
app.use('/contacto', contacto);
app.use('/productos', productos);
app.use('/recetas', recetas);
app.use('/producto', producto);
app.use('/login', login);
// Categorias
app.use('/tortas', tortas);
app.use('/chocolateria', chocolateria);
app.use('/panaderia', panaderia);
app.use('/cajas', cajas);
app.use('/pascuas', pascuas);
app.use('/especiales', especiales);
// Admin
app.use('/admin/adminproducto', adminproducto);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
