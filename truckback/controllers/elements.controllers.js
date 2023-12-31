import { pool } from "../db.js";

export const getElements = async (req, res) => {
  try {
    const [result] = await pool.query(
      "select * from elementos order by idCategoria asc"
    );
    res.json(result);
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};

export const getElement = async (req, res) => {
  try {
    const [result] = await pool.query(
      "select * from elementos where id = ?",
      [req.params.id]
    );
    if (result.length === 0)
      return res.status(404).json({ mensaje: "Element does not exists" });
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};

export const newElement = async (req, res) => {
  try {
    const { codigo, nombre, descripcion, idCategoria } = req.body;
    const [result] = await pool.query(
      "insert into elementos (codigo, nombre, descripcion, idCategoria) values (?,?,?,?)",
      [codigo, nombre, descripcion, idCategoria]
    );
    res.json(result);
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};

export const updateElement = async (req, res) => {
    try {
      const [result]=await pool.query("update elementos set ? where id = ?", [
        req.body,
        req.params.id,
      ]);
      if (result.affectedRows === 0)
        return res.status(404).json({ mensaje: "Element does not exists" });
      res.json("Element updated");
    } catch (error) {
      return res.status(500).json({ mensaje: error.message });
    }
  };

  export const deleteElement = async (req, res) => {
    try {
      const [resultado] = await pool.query("delete from elementos where id = ?", [
        req.params.id,
      ]);
      if (resultado.affectedRows === 0)
        return res.status(404).json({ mensaje: "Element does not exists" });
      res.json("Element deleted");
    } catch (error) {
      return res.status(500).json({ mensaje: error.message });
    }
  };
