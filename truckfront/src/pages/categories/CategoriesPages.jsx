import React from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useEffect, useState } from "react";
import { getCategoriesRequest } from "../../api/categories.api.js";

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
      <h2>Categories....</h2>
      <table border="1">
        <thead>
          <tr>
            <th>Code</th>
            <th>Name</th>
          </tr>
        </thead>
        <tbody>
          {categories.map((cate) => (
            <tr key={cate.id}>
              <td>{cate.id}</td>
              <td>{cate.nombre}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default CategoriesPage;
