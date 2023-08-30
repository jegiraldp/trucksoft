import React from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useEffect } from "react";
import { useCategory } from "../../context/CategoryProvider.jsx";
import { useNavigate } from "react-router-dom";

//cargarCategories
function CategoriesPage() {
  const { categories, cargarCategories, deleteCategory } = useCategory();
  const navigate = useNavigate();
  useEffect(() => {
    cargarCategories();
  }, []);

  return (
    <>
      <HomeAdmin />
      <h3>Categories</h3>
      <table border="0">
        <thead>
          <tr align="left">
            
            <th>Name</th>
            <th>Opciones</th>
          </tr>
        </thead>
        <tbody>
          {categories.map((cate) => (
            <tr key={cate.id}>
              
              <td>{cate.nombre}</td>
              <td>&nbsp;&nbsp;&nbsp;
                <span
                  onClick={() => navigate(`./edit/${cate.id}`)}
                >
                  &#9998; 
                </span>
                &nbsp;&nbsp;&nbsp;
                <span onClick={() => deleteCategory(cate.id)}>&#9932;</span>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default CategoriesPage;
