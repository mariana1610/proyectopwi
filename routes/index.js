var express = require('express');
var router = express.Router();
const productoService = require('./../models/producto');
const { main } = require('./../utils/mail')
const sha1 = require ("sha1");


/* GET home page. */
router.get('/', async (req, res) => {
  const productos = await productoService.getProducts();
  // console.log(productos);
  res.render('index', { title: 'BMR Cakes', productos : productos});
});


/* mail de contacto */
router.post("/", async (req,res)=> {
  const { email, mensaje, nombre, telefono } = req.body;
  const to = process.env.ADMIN_MAIL;
  const subject = "Nuevo mensaje desde el sitio web BMR Cakes";
  const html = `${nombre}, tel. ${telefono}, se contactó desde ${email} con la siguiente consulta: ${mensaje}`;
  
  const finalObject = {
    to,
    subject,
    html,
  };

  const resultMail = await main({to, subject,html});
  console.log(resultMail);
  res.render('index', {
    message : 'Mensaje enviado, en breve nos contactaremos.'});
});


module.exports = router;
