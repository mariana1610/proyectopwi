const pool = require('./../utils/bd');

getCategories = async () => {
    try {
        const query = "select id_categoria,nombre,categoria_status from categoria";
        const rows = await pool.query(query);
        return rows;
    } catch ( error ){
        console.log(error)
    }
}
module.exports = {
    getCategories
}