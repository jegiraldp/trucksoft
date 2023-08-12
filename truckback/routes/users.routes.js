import { Router } from "express";
import {
  getUsers,
  getUser,
  updateUser,
  newUser,
  deleteUser,
} from "../controllers/users.controllers.js";

const router = Router();

router.get("/users", getUsers);
router.get("/users/:userName", getUser);
router.post("/users", newUser);
router.put("/users/:id", updateUser);
router.delete("/users/:id", deleteUser);

export default router;
