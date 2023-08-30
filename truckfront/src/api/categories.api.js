import axios from "axios";

export const getCategoriesRequest = async () =>
  await axios.get("http://localhost:3000/categories");

export const createCategoryRequest = async (category) =>
  await axios.post("http://localhost:3000/categories", category);

export const deleteCategoryRequest = async (id) =>
  await axios.delete(`http://localhost:3000/categories/${id}`);

export const getCategoryRequest = async (id) =>
  await axios.get(`http://localhost:3000/categories/${id}`);

export const updateCategoryRequest = async (id, newFields) =>
  await axios.put(`http://localhost:3000/categories/${id}`, newFields);
