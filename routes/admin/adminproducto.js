const express = require('express');
const session = require("express-session");
const router = express.Router();
const { getProducts, getProduct, create, update } = require("./../../models/producto");
const { getCategories } = require("./../../models/categoria");

/* Baja de productos */
router.get("/baja/:id", async (req, res) => {
  if(req.session.administrador){
  try {
    const { id } = req.params;
    const result = await update(id, { status: 0 });
    res.redirect("/admin/adminproducto");
  } catch (error) {}
  }
  else{
    res.send("no tenes permisos para ingresar")
  }
});

/* Modificar productos */
router.get("/modificar/:id", async (req, res) => {
  if(req.session.administrador){
  const categoria = await getCategories();
  const producto = await getProduct();
  res.render("editproducto", { categoria, producto }); 
  }
  else{
    res.send("No tiene permisos para ingresar.")
  }
});

router.put("/modificar/:id", (req, res) => {
  console.log(req.params.id);
  console.log(req.body);
  res.json({ status: true });
});

/* Alta de productos */
router.get("/alta", async (req, res) => {
  if(req.session.administrador){
  const categoria = await getCategories();
  res.render("altaproducto", { categoria }); 
  }
  else{
    res.send("No tiene permisos para ingresar.")
  }
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
  if(req.session.administrador){
  try {
    const productos = await getProducts();
    res.render("adminproducto", { productos });
  } catch (error) {}
  }
  else{
    res.send("No tiene permisos para ingresar.")
  }
});

module.exports = router;