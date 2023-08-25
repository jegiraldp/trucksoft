import React from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useEffect, useState } from "react";
import { getCategoriesRequest } from "../../api/categories.api.js";
import { deleteCategoryRequest } from "../../api/categories.api.js";

//eliminarCategories
const handleDelete = async (id) => {
  try {
    await deleteCategoryRequest(id);
    console.log("Category Deleted " + id);
  } catch (error) {
    console.log("Delete Error");
  }
};

//cargarCategories
function CategoriesPage() {
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    async function cargarCategories() {
      const respues = await getCategoriesRequest();
      setCategories(respues.data);
    }
    cargarCategories();
  }, []);

  return (
    <>
      <HomeAdmin />
      <h3>Categories</h3>
      <table border="1">
        <thead>
          <tr align="left">
            <th>Code</th>
            <th>Name</th>
            <th />
          </tr>
        </thead>
        <tbody>
          {categories.map((cate) => (
            <tr key={cate.id}>
              <td>{cate.id}</td>
              <td>{cate.nombre}</td>
              <td>
                <span onClick={() => console.log(cate.id)}>✏️</span>
                &nbsp;&nbsp;&nbsp;
                <span onClick={() => handleDelete(cate.id)}>❌</span>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default CategoriesPage;
