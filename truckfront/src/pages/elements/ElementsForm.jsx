import React, { createElement } from "react";
import { useEffect, useState } from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useCategory } from "../../context/CategoryProvider.jsx";
import { useElement } from "../../context/ElementProvider.jsx";
import { useNavigate, useParams } from "react-router-dom";
import { Form, Formik } from "formik";

function ElementsForm() {
  const params = useParams();
  const navigate = useNavigate();
  const { categories, cargarCategories } = useCategory();
  const { createElement, getElement, updateElement } = useElement();
  const [element, setElement] = useState({
    codigo: "",
    nombre: "",
    descripcion: "",
    idCategoria: "",
  });

  useEffect(() => {
    const loadElement = async () => {
      if (params.id) {
        const element = await getElement(params.id);
        //console.log(element.codigo)
        setElement({
          codigo: element.codigo,
          nombre: element.nombre,
          descripcion: element.descripcion,
          idCategoria: element.idCategoria,
        });
      }
    };
    loadElement();
    ///
    cargarCategories();
  }, []);


  return (
    <>
      <HomeAdmin />
      <span onClick={() => navigate("/homeadmin/elements")}>👈Back</span>
      <h3>{params.id ? "Edit Element" : "Create Element"}</h3>
      <Formik
        initialValues={element}
        validate={(values) => {
          let errores = {};
          if (!values.codigo) {
            errores.codigo = "⚠️ Write element's code";
          }else if (isNaN(values.codigo)) {
            errores.codigo = "⚠️ Code must be a number";
          }
          if (!values.nombre) {
            errores.nombre = "⚠️ Write element's name";
          }
          if (!values.descripcion) {
            errores.descripcion = "⚠️ Write element's decription";
          }
          if (values.idCategoria==0) {
            errores.idCategoria = "⚠️ Select element's category";
          }
          return errores;
        }}
        enableReinitialize={true}
        onSubmit={async (values) => {
          if (params.id) {
            await updateElement(params.id, values);
            navigate("/homeadmin/elements");
          } else {
            await createElement(values);
            navigate("/homeadmin/elements");
          }
          setElement({
            codigo: "",
            nombre: "",
            descripcion: "",
            idCategoria: "",
          });
        }}
      >
        {({
          handleChange,
          handleSubmit,
          handleBlur,
          values,
          errors,
          isSubmitting,
          touched,
        }) => (
          <Form onSubmit={handleSubmit} width="500px">
            <label>Code</label>
            <input
              type="text"
              name="codigo"
              placeholder="Write element's code"
              onChange={handleChange}
              value={values.codigo}
              onBlur={handleBlur}
            />

            <label>Name</label>
            <input
              type="text"
              name="nombre"
              placeholder="Write element's name"
              onChange={handleChange}
              value={values.nombre}
              onBlur={handleBlur}
            />
            <label>Description</label>
            <textarea
              name="descripcion"
              rows="3"
              placeholder="Write element's description"
              onChange={handleChange}
              value={values.descripcion}
              onBlur={handleBlur}
            ></textarea>
            <label>Category</label>
            <select
              name="idCategoria"
              onChange={handleChange}
              value={values.idCategoria}
              onBlur={handleBlur}
            >
              <option value="0" label="Select a category">
                Select a category{" "}
              </option>
              {categories.map((cat) => (
                <option key={cat.id} value={cat.id}>
                  {cat.nombre}
                </option>
              ))}
            </select>
            <button type="submit" disabled={isSubmitting}>
              {params.id
                ? "Edit"
                : "Save" && isSubmitting
                ? "Saving..."
                : "Save"}
            </button>
            {touched.codigo && errors.codigo && <div>{errors.codigo}</div>}
            {touched.nombre && errors.nombre && <div>{errors.nombre}</div>}
            {touched.descripcion && errors.descripcion && (
              <div>{errors.descripcion}</div>
            )}
            {touched.idCategoria && errors.idCategoria && <div>{errors.idCategoria}</div>}
          </Form>
        )}
      </Formik>
    </>
  );
}

export default ElementsForm;
