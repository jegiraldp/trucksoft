import { pool } from "../db.js";
import bcrypt from "bcrypt";

export const getUsers = async (req, res) => {
  try {
    const [result] = await pool.query(
      "select * from usuarios order by nombreCompleto asc"
    );
    res.json(result);
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};

export const getUser = async (req, res) => {
  try {
    const { userName } = req.params;
    const { password } = req.body;

    const [result] = await pool.query(
      "select * from usuarios where userName = ?",
      [userName]
    );

    if (result.length === 0) {
      return res.status(404).json({ mensaje: "User does not exists" });
    } else {
      if (!(await bcrypt.compare(password, result[0].password))) {
        return res.status(404).json({ mensaje: "Incorrect data" });
      } else {
        res.json(result[0].nombreCompleto);
      }
    }
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};

export const newUser = async (req, res) => {
  try {
    const { nombreCompleto, email, userName, password, perfil } = req.body;
    const finalPass = await bcrypt.hash(password, 10);
    const [result] = await pool.query(
      "insert into usuarios (nombreCompleto,email,userName,password,perfil) values (?,?,?,?,?)",
      [nombreCompleto, email, userName, finalPass, perfil]
    );
    res.json(result);
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};

export const updateUser = async (req, res) => {
  try {
    const { nombreCompleto, email, userName, password, perfil } = req.body;
    const finalPass = await bcrypt.hash(password, 10);
    const [result] = await pool.query("update usuarios set nombreCompleto=?,email=?, userName=?, password=?, perfil=? where id = ?", [
      nombreCompleto,
      email,
      userName,
      finalPass,
      perfil,
      req.params.id
    ]);
    if (result.affectedRows === 0)
      return res.status(404).json({ mensaje: "User does not exists" });
    res.json("User updated");
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};

export const deleteUser = async (req, res) => {
  try {
    const [resultado] = await pool.query("delete from usuarios where id = ?", [
      req.params.id,
    ]);
    if (resultado.affectedRows === 0)
      return res.status(404).json({ mensaje: "User does not exists" });
    res.json("User deleted");
  } catch (error) {
    return res.status(500).json({ mensaje: error.message });
  }
};
