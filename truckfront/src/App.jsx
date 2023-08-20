import React from 'react'
import { Route, Routes } from 'react-router-dom'
import CategoriesPage from './pages/categories/CategoriesPages.jsx'
import CategoriesForm from './pages/categories/CategoriesForm.jsx'
import HomeAdmin from './components/HomeAdmin.jsx'

function App() {
  return (
   <>
   <HomeAdmin/>
   <hr />
    <Routes>
      <Route path="/categories" element={<CategoriesPage/>}/>
      <Route path="/categories/new" element={<CategoriesForm/>}/>
    </Routes >
   </>
  )
}

export default App