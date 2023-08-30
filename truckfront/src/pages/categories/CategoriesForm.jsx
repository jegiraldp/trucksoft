import React, { useEffect, useState } from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { Form, Formik } from "formik";
import { useCategory } from "../../context/CategoryProvider.jsx";
import { useParams, useNavigate } from "react-router-dom";

function CategoriesForm() {
  const params = useParams();
  const navigate = useNavigate();
  const { createCategory, getCategory, updateCategory } = useCategory();
  const [category, setCategory] = useState({
    nombre: "",
  });

  useEffect(() => {
    const loadCategory = async () => {
      if (params.id) {
        const category = await getCategory(params.id);
        //console.log(category)
        setCategory({
          nombre: category.nombre,
        });
      }
    };
    loadCategory();
  }, []);

  return (
    <>
      <HomeAdmin />
      <h3>{params.id ? "Edit Category" : "Create Category"}</h3>
      <Formik
        initialValues={category}
        enableReinitialize={true}
        onSubmit={async (values, actions) => {
          if (params.id) {
            await updateCategory(params.id, values);
            navigate("/homeadmin/categories");
          } else {
            await createCategory(values);
            navigate("/homeadmin/categories");
          }
          setCategory({
            nombre: "",
          });
        }}
      >
        {({ handleChange, handleSubmit, values, isSubmitting }) => (
          <Form onSubmit={handleSubmit}>
            <label>Name</label>
            <input
              type="text"
              name="nombre"
              placeholder="Write Category name"
              onChange={handleChange}
              value={values.nombre}
            />
            <button type="submit" disabled={isSubmitting}>
              {params.id ? "Editar":"Salvar" && isSubmitting ? "Salvando..." : "Salvar"}
            </button>
          </Form>
        )}
      </Formik>
    </>
  );
}

export default CategoriesForm;
