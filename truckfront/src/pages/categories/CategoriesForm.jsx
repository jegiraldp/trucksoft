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
      <span onClick={() => navigate("/homeadmin/categories")}>👈Back</span>
      <h3>{params.id ? "Edit Category" : "Create Category"}</h3>
      <Formik
        initialValues={category}
        validate={(values) => {
          let errores = {};
          if (!values.nombre) {
            errores.nombre = "⚠️ Write Category's name";
          }

          return errores;
        }}
        enableReinitialize={true}
        onSubmit={async (values) => {
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
        {({
          handleChange,
          handleBlur,
          handleSubmit,
          values,
          errors,
          isSubmitting,
          touched,
        }) => (
          <Form onSubmit={handleSubmit} width="500px">
            <label>Name</label>
            <input
              type="text"
              name="nombre"
              placeholder="Write Category's name"
              onChange={handleChange}
              value={values.nombre}
              onBlur={handleBlur}
            />

            <button type="submit" disabled={isSubmitting}>
              {params.id
                ? "Edit"
                : "Save" && isSubmitting
                ? "Saving..."
                : "Save"}
            </button>
            {touched.nombre && errors.nombre && <div>{errors.nombre}</div>}
          </Form>
        )}
      </Formik>
    </>
  );
}

export default CategoriesForm;
