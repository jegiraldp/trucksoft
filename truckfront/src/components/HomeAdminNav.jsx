import React from "react";
import { Link } from "react-router-dom";

function HomeAdminNav() {
  return (
    <div>
      <ul>
        <li><Link>Customer List</Link></li>
        <li><Link>New Customer</Link></li>

        <li><Link>Provider List</Link></li>
        <li><Link>New Provider</Link></li>

        <li><Link>Employed List</Link></li>
        <li><Link>New Employed</Link></li>
      
        <li><Link to="/categories">Category List</Link></li>
        <li><Link to="/categories/new">New Category</Link></li>
      
        <li><Link>Element List</Link></li>
        <li><Link>New Element</Link></li>
      
        <li><Link>Service List</Link></li>
        <li><Link>New Service</Link></li>
      </ul>
    </div>
  );
}

export default HomeAdminNav;
