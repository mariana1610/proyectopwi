const express = require('express');
const router = express.Router();
const { main } = require('./../utils/mail')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('contacto', { title: 'BMR Cakes' });
});

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
  res.render('contacto', {
    message : 'Mensaje enviado, en breve nos contactaremos.'});
});

module.exports = router;