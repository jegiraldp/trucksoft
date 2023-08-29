import React from "react";
import { Route, Routes, BrowserRouter } from "react-router-dom";
import CategoriesPage from "./pages/categories/CategoriesPages.jsx";
import CategoriesForm from "./pages/categories/CategoriesForm.jsx";
import HomeAdmin from "./components/HomeAdmin.jsx";
import NotFound from "./pages/NotFound";
import { CategoryContextProvider } from "./context/CategoryProvider.jsx";

function App() {
  return (
    <BrowserRouter>
      <CategoryContextProvider>
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
          <Route path="*" element={<NotFound />} />
        </Routes>
      </CategoryContextProvider>
    </BrowserRouter>
  );
}

export default App;
