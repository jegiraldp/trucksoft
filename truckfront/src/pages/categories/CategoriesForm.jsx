import React from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { Form, Formik } from "formik";
import { createCategoryRequest } from "../../api/categories.api.js";

function CategoriesForm() {
  return (
    <>
      <HomeAdmin />
      <h3>Add category</h3>
      <Formik
        initialValues={{
          nombre: "",
        }}
        onSubmit={async (values, actions) => {
          //console.log(values);
          try {
            const respon = await createCategoryRequest(values);
            actions.resetForm()
            console.log(respon);
          } catch (error) {
            console.log(error);
          }
        }}
      >
        {({ handleChange, handleSubmit, values }) => (
          <Form onSubmit={handleSubmit}>
            <label>Name</label>
            <input
              type="text"
              name="nombre"
              placeholder="Write Category name"
              onChange={handleChange}
              value={values.nombre}
            />
            <button type="submit">Save</button>
          </Form>
        )}
      </Formik>
    </>
  );
}

export default CategoriesForm;
