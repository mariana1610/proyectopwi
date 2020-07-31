const express = require('express');
const router = express.Router();
const { getProducts, getProduct, create, update } = require("./../../models/producto");
const { getCategories } = require("./../../models/categoria");

/* Alta de productos */
router.get("/alta", async (req, res) => {
  const categoria = await getCategories();
  res.render("altaproducto", { categoria }); // categorias
});

router.post("/alta", async (req, res) => {
  try {
    const { nombre, descripcion, categoria, precio, descuento } = req.body;
    const object = {
      nombre: nombre,
      descripcion: descripcion,
      categoria: parseInt(categoria),
      precio: precio,
      descuento: descuento,
    };
    const result = await create(object);
    console.log(`El insert id retornado es : ${result}`);
    res.render("altaproducto", { message: "Producto dado de alta" });
  } catch (error) {
    console.log(error);
  }
});

/* Cargar todos los productos en la página */
router.get("/", async (req, res) => {
  try {
    const productos = await getProducts();
    // console.log(productos);
    res.render("adminproducto", { productos });
  } catch (error) {}
});

module.exports = router;