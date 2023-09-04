import React, { createElement } from "react";
import { useEffect } from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { useCategory } from "../../context/CategoryProvider.jsx";
import { useElement } from "../../context/ElementProvider.jsx";
import { useNavigate, useParams } from "react-router-dom";
import { Form, Formik } from "formik";

function ElementsForm() {
  const params = useParams();
  const navigate = useNavigate();
  const { categories, cargarCategories } = useCategory();
  const { elements, createElement } = useElement();

  useEffect(() => {
    cargarCategories();
  }, []);

  return (
    <>
      <HomeAdmin />
      <span onClick={() => navigate("/homeadmin/elements")}>👈Back</span>
      <h3>{params.id ? "Edit Element" : "Create Element"}</h3>
      <Formik
        initialValues={{
          codigo: "",
          nombre: "",
          descripcion: "",
          idCategoria: "",
        }}
        onSubmit={async (values) => {
            try{
                await createElement(values);
                navigate("/homeadmin/elements");
            }catch(error){
                console.log(error)
            }
          }
        }
      >
        {({ handleChange, handleSubmit, isSubmitting }) => (
          <Form onSubmit={handleSubmit} width="500px">
            <label>Code</label>
            <input
              type="text"
              name="codigo"
              placeholder="Write element's code"
              onChange={handleChange}
            />
            <label>Name</label>
            <input
              type="text"
              name="nombre"
              placeholder="Write element's name"
              onChange={handleChange}
            />
            <label>Description</label>
            <textarea
              name="descripcion"
              rows="3"
              placeholder="Write element's description"
              onChange={handleChange}
            ></textarea>
            <label>Category</label>
            <select name="idCategoria" onChange={handleChange}>
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
          </Form>
        )}
      </Formik>
    </>
  );
}

export default ElementsForm;
