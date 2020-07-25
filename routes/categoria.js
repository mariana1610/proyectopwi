var express = require('express');
var router = express.Router();
const productoService = require('./../models/producto');
const { getCategories } = require('./../models/categoria');
const { getTorta } = require('./../models/producto');

/* GET home page. */
router.get('/', async (req, res) => {
  const productos = await productoService.getTorta();
  const categorias = await getCategories();
  console.log(productos);
  res.render('categoria', { 
    title: 'BMR Cakes',
    productos,
    categorias,
    });
});



module.exports = router;