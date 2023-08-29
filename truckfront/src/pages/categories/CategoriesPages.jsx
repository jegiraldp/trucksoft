import React from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useEffect } from "react";
import { useCategory } from "../../context/CategoryProvider.jsx";



//cargarCategories
function CategoriesPage() {
  const { categories,cargarCategories, deleteCategory } = useCategory();
  useEffect(() => {
    
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
                <span onClick={() => deleteCategory(cate.id)}>❌</span>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default CategoriesPage;
