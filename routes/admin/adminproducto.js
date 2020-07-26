const express = require('express');
const router = express.Router();
const { getProducts, getProduct, create, update } = require("./../../models/producto");
const { getCategories } = require("./../../models/categoria");

/* Cargar todos los productos en la página */
router.get("/", async (req, res) => {
  try {
    const productos = await getProducts();
    console.log(productos);
    res.render("adminproducto", { productos });
  } catch (error) {}
});
/* Publicar productos */
module.exports = router;