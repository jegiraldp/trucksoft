import React from "react";
import HomeAdmin from "../../components/HomeAdmin.jsx";
import { Form, Formik } from "formik";

function CategoriesForm() {
  return (
    <>
      <HomeAdmin />
      <h3>Add category</h3>
      <Formik>
        <Form>
          <label>Name</label>
          <input type="text" name="Name" placeholder="Write Category name"/>
          <button>Save</button>
        </Form>
      </Formik>
    </>
  );
}

export default CategoriesForm;
