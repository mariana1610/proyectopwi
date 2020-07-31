const express = require('express');
const router = express.Router();
const {logueado} = require("./../models/loginModel");

router.get("/", async (req, res) => {
  try {
    res.render("login");
  } catch (error) {
      console.log(error);
  }
});
router.post("/", async (req, res, next) => {
  var usuario = req.body.usuario;
  var password = req.body.password;
  const resultado = await logueado(usuario, password);
  if(resultado.length == 1){
    console.log('logueado');
    req.session.username = usuario;
    if(resultado[0].admin == 1){
        req.session.administrador = true;
        res.redirect('/admin/adminproducto');
    }
    else{
        req.session.administrador = false;
        res.redirect('/');
    }
}
else {
    console.log('usuario o contraseña incorrectos');
}



});
module.exports = router;