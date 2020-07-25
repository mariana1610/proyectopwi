var express = require('express');
var router = express.Router();
const productoService = require('../models/producto');
const { getCategories } = require('../models/categoria');
const { getCajas } = require('../models/producto');

/* GET home page. */
router.get('/', async (req, res) => {
  const productos = await productoService.getCajas();
  const categorias = await getCategories();
   res.render('Cajas', { 
    title: 'BMR Cakes',
    productos,
    categorias,
    });
});


module.exports = router;