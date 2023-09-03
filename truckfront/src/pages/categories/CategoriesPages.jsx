import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useEffect, useState } from "react";
import { useCategory } from "../../context/CategoryProvider.jsx";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";

//cargarCategories
function CategoriesPage() {
  const { categories, cargarCategories, deleteCategory } = useCategory();
  const navigate = useNavigate();
  const [mensaje, setMensaje] = useState("");
  const [elId, setElId] = useState(0);
  useEffect(() => {
    cargarCategories();
  }, []);

  return (
    <>
      <HomeAdmin />
      <h3>
        Categories
        <span onClick={() => navigate("/homeadmin/categories/new")}>
          &nbsp;&nbsp;&nbsp;➕
        </span>
      </h3>
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
              <td>
                &nbsp;&nbsp;&nbsp;
                <span onClick={() => navigate(`./edit/${cate.id}`)}>✏️</span>
                &nbsp;&nbsp;&nbsp;
                <span
                  onClick={async () => {
                    setElId(0);
                    const resul = await deleteCategory(cate.id);
                    if (resul) {
                      setMensaje(resul);
                      setElId(cate.id);
                    }
                  }}
                >
                  ❌
                </span>
                {elId == cate.id && (
                  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{mensaje}⚠️</span>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default CategoriesPage;
