const pool = require('./../utils/bd');

const getProducts = async () => {
    try {
        const query = 
        "SELECT id_producto, producto.nombre, producto.descripcion, producto.precio, categoria.nombre as nombre_categoria, producto.imagen FROM ?? JOIN ?? ON producto.categoria = categoria.id_categoria";
        const rows = await pool.query(query, [
        process.env.TABLA_PRODUCTO,
        process.env.TABLA_CATEGORIA,
      ]);
      return rows; 
    } catch (error) {
      console.log(error);
    }
};

const getProduct = async (id) => {
  try {
    const query =
      "SELECT id, nombre, descripcion ,precio , imagen FROM ?? WHERE id = ?";
    const params = [process.env.TABLA_PRODUCTO, id];
    const rows = await pool.query(query, params);
    return rows[0];
  } catch (error) {
    console.log(error);
  }
};

const getTorta = async () => {
    try {
      const query = "SELECT id_producto, nombre, descripcion, precio, categoria, imagen FROM `producto` WHERE `categoria` = 1";
      const rows = await pool.query(query);
      return rows;
    } catch (error) {
      console.log(error);
    }
};

const getChocolateria = async () => {
  try {
    const query = "SELECT id_producto, nombre, descripcion, precio, categoria, imagen FROM `producto` WHERE `categoria` = 2";
    const rows = await pool.query(query);
    return rows;
  } catch (error) {
    console.log(error);
  }
};

const getPanaderia = async () => {
    try {
      const query = "SELECT id_producto, nombre, descripcion, precio, categoria, imagen FROM `producto` WHERE `categoria` = 3";
      const rows = await pool.query(query);
      return rows;
    } catch (error) {
      console.log(error);
    }
};

const getCajas = async () => {
  try {
    const query = "SELECT id_producto, nombre, descripcion, precio, categoria, imagen FROM `producto` WHERE `categoria` = 4";
    const rows = await pool.query(query);
    return rows;
  } catch (error) {
    console.log(error);
  }
};

const getPascuas = async () => {
  try {
    const query = "SELECT id_producto, nombre, descripcion, precio, categoria, imagen FROM `producto` WHERE `categoria` = 5";
    const rows = await pool.query(query);
    return rows;
  } catch (error) {
    console.log(error);
  }
};

const getEspeciales = async () => {
  try {
    const query = "SELECT id_producto, nombre, descripcion, precio, categoria, imagen FROM `producto` WHERE `categoria` = 6";
    const rows = await pool.query(query);
    return rows;
  } catch (error) {
    console.log(error);
  }
};

const create = async (obj) => {
  const query = "INSERT INTO ?? SET ?";
  const params = [process.env.TABLA_PRODUCTO, obj];
  const rows = await pool.query(query, params);
  return rows.insertId; 
};

module.exports = {
    getProducts,
    getProduct,
    getTorta,
    getChocolateria,
    getPanaderia,
    getCajas,
    getPascuas,
    getEspeciales,
    create,
};

