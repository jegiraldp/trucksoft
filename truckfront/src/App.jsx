import React from "react";
import { Route, Routes, BrowserRouter } from "react-router-dom";
import CategoriesPage from "./pages/categories/CategoriesPages.jsx";
import CategoriesForm from "./pages/categories/CategoriesForm.jsx";
import ElementsPage from "./pages/elements/ElementsPages.jsx";
import ElementsForm from "./pages/elements/ElementsForm.jsx";
import HomeAdmin from "./components/HomeAdmin.jsx";
import NotFound from "./pages/NotFound";
import { CategoryContextProvider } from "./context/CategoryProvider.jsx";
import { ElementContextProvider } from "./context/ElementProvider.jsx";


function App() {
  return (
    <BrowserRouter>
      <CategoryContextProvider><ElementContextProvider>
        Home
        <hr />
        <Routes>
          <Route path="/" />
          <Route path="/homeadmin" element={<HomeAdmin />} />
          <Route path="/homeadmin/categories" element={<CategoriesPage />} />
          <Route
            path="/homeadmin/categories/new"
            element={<CategoriesForm />}
          />
          <Route path="/homeadmin/categories/edit/:id" element={<CategoriesForm />} />
          
          <Route path="/homeadmin/elements" element={<ElementsPage />} />
          <Route path="/homeadmin/elements/new" element={<ElementsForm />}/>

          <Route path="*" element={<NotFound />} />
        </Routes>
        </ElementContextProvider>
      </CategoryContextProvider>
    </BrowserRouter>
  );
}

export default App;
