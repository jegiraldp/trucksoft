import { Router } from "express";
import {
  getElements,
  getElement,
  newElement,
  updateElement,
  deleteElement
} from "../controllers/elements.controllers.js";

const router = Router();

router.get("/elements", getElements);
router.get("/elements/:id", getElement);
router.post("/elements", newElement);
router.put("/elements/:id",updateElement)
router.delete("/elements/:id", deleteElement);

export default router;