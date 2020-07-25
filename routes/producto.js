var express = require('express');
var router = express.Router();
const productoService = require('./../models/producto');


/* GET home page. */
router.get('/', async (req, res) => {
  const productos = await productoService.getProducts();
  console.log(productos);
  res.render('producto', { title: 'BMR Cakes' });
});


module.exports = router;