import React from "react";
import { Link } from "react-router-dom";

function HomeAdmin() {
  return (
    <>
      <h3>Home Admin..</h3>
      <ul>
        <li>
          <Link to="/homeadmin/categories">Categories</Link>
        </li>

        <li>
          <Link to="/homeadmin/elements">Elements</Link>
        </li>
               
      </ul>
      <hr />
    </>
  );
}

export default HomeAdmin;
