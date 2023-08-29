import { useContext, useState } from "react";
import { CategoryContext } from "./CategoryContext.jsx";
import {
  getCategoriesRequest,
  deleteCategoryRequest,
} from "../api/categories.api.js";

export const useCategory = () => {
  const context = useContext(CategoryContext);
  if (!context) {
    throw new Error("Error in context");
  }
  return context;
};

export const CategoryContextProvider = ({ children }) => {
  const [categories, setCategories] = useState([]);

  //cargar Categories
  async function cargarCategories() {
    const respues = await getCategoriesRequest();
    setCategories(respues.data);
  }

  //eliminarCategories
  const deleteCategory = async (id) => {
    try {
      await deleteCategoryRequest(id);
      setCategories(categories.filter(category => category.id !== id))
      console.log("Category Deleted " + id);
    } catch (error) {
      console.log("Delete Error");
    }
  };

  return (
    <CategoryContext.Provider
      value={{ categories, cargarCategories, deleteCategory }}
    >
      {children}
    </CategoryContext.Provider>
  );
};
