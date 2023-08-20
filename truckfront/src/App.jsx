import React from 'react'
import { Route, Routes } from 'react-router-dom'
import CategoriesPage from './pages/categories/CategoriesPages.jsx'
import CategoriesForm from './pages/categories/CategoriesForm.jsx'

function App() {
  return (
    <Routes>
      <Route path="/categories" element={<CategoriesPage/>}/>
      <Route path="/categories/new" element={<CategoriesForm/>}/>
    </Routes >
  )
}

export default App