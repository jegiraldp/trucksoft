import React from "react";
import { Link } from "react-router-dom";

function HomeAdmin() {
  return (
    <>
      <h3>Home Admin..</h3>
      <ul>
        <li>
          <Link to="/homeadmin/categories">Category List..</Link>
          &nbsp;|&nbsp;
          <Link to="/homeadmin/categories/new">New Category</Link>
        </li>

        <li>
          <Link to="/homeadmin/elements">Element List</Link>
          &nbsp;|&nbsp;
          <Link to="/homeadmin/elements/new">New Element</Link>
        </li>
               
      </ul>
      <hr />
    </>
  );
}

export default HomeAdmin;
