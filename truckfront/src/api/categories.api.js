import axios from "axios";

export const createCategoryRequest = async (category) =>
  await axios.post("http://localhost:3000/categories", category);
