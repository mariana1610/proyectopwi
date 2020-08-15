const express = require('express');
const session = require("express-session");
const router = express.Router();
const { getProducts, getProduct, create, update } = require("./../../models/producto");
const { getCategories } = require("./../../models/categoria");
const pool = require('../../utils/bd');
const categoria = require('./../../models/categoria');
const imgHandler = require('./../../utils/imageHandler');
const multer = require('multer');
const config = { dest: "./public/tmp" };
const upload = multer(config);

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
  try {
     const categoria = await getCategories();
     const { id } = req.params;
     const product = await getProduct (id);
     res.render("editproducto", { product : product, categoria : categoria }); 
  } catch (error) {}
    }
    else{
      res.send("No tiene permisos para ingresar.")
    }
  });

router.post("/modificar/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { nombre, descripcion, categoria, precio, descuento } = req.body;
    const obj = {
        nombre: nombre,
        descripcion: descripcion,
        categoria: parseInt(categoria),
        precio: precio,
        descuento: descuento,
        };
    console.log(obj);
    const result = await update (id, obj);
    res.redirect("/admin/adminproducto");
  } catch (error) {}
});

/* Seleccionar imagen */
router.get("/imagen/:id", async (req, res) => {
  if(req.session.administrador){
  try {
     const categoria = await getCategories();
     const { id } = req.params;
     const product = await getProduct (id);
     res.render("adminimagen", { product : product, categoria : categoria }); 
  } catch (error) {}
    }
    else{
      res.send("No tiene permisos para ingresar.")
    }
  });

router.post('/imagen/:id', upload.single("imagen"), async (req, res) => {
  try {
      const { id } = req.params;
      console.log(req.body);
      console.log(req.file);
      const img = imgHandler.saveImage(req.file);
      console.log(`La imagen se guardo como ${img}`);
      const objimagen = {
        imagen : img
      };
      await update (id, objimagen)
      res.redirect("/admin/adminproducto");
  } catch (error) {
    console.log(error);
  }
});

// files.single o upload.single
// router.post("/imagen/:id", files.single("imagen"), async (req, res) => {
//   try {
//   console.log(req.files);
//   const { nombre } = req.body;
//   const img = imgHandler.saveImage(req.file);
//   console.log(`La imagen se guardo como ${img}`);
//   const obj = {
//     nombre,
//     imagen: img,
//   };
//   await service.add(obj);
//   res.send();
//   } catch (error) {
//     console.log(error);
//   }
// });

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