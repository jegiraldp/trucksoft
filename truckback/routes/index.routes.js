import { Router } from "express";
import { pool } from "../db.js";
const router = Router();
///
router.get('/categorias', async (req, res) => {
  const [result] = await pool.query("select * from categorias");
  console.log(result[0].nombre);
  res.json(result);
});

router.get('/', async (req, res) => {
    console.log("Server ok");
   
  });

///
export default router;