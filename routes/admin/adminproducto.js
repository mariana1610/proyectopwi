const express = require('express');
const router = express.Router();
const { getProducts, create, update } = require("./../../models/producto");
const { getCategories } = require("./../../models/categoria");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('adminproducto', { title: 'BMR Cakes' });
});

module.exports = router;