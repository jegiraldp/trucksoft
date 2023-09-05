import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useEffect, useState } from "react";
import { useElement } from "../../context/ElementProvider.jsx";
import { useCategory } from "../../context/CategoryProvider.jsx";
import { useNavigate } from "react-router-dom";

//loadElements
function ElementsPage() {
  const { elements, cargarElements, deleteElement } = useElement();
  const { categories, cargarCategories } = useCategory();
  const [mensaje, setMensaje] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    cargarElements();
    cargarCategories();
  }, []);

  const getCategoryName = (categoryId) => {
    const category = categories.find((cat) => cat.id === categoryId);
    return category ? category.nombre : "N/A";
  };

  return (
    <>
      <HomeAdmin />
      <h3>
        Elements
        <span onClick={() => navigate("/homeadmin/elements/new")}>
          &nbsp;&nbsp;&nbsp;➕
        </span>
      </h3>
      <table border="0" width="80%">
        <thead>
          <tr align="left">
            <th>Code</th>
            <th>Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Opciones</th>
          </tr>
        </thead>
        <tbody>
          {elements.map((ele) => (
            <tr key={ele.id}>
              <td>{ele.codigo}</td>
              <td>{ele.nombre}</td>
              <td>{ele.descripcion}</td>
              <td>{getCategoryName(ele.idCategoria)}</td>
              <td>
                &nbsp;&nbsp;&nbsp;
                <span onClick={() => navigate(`./edit/${ele.id}`)}>✏️</span>
                &nbsp;&nbsp;&nbsp;
                <span
                  onClick={async () => {
                    const resul = await deleteElement(ele.id);
                    if (resul) {
                      setMensaje(resul);
                    }
                  }}
                >
                  ❌
                </span>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default ElementsPage;
