import { ElementContext } from "./TheContext.jsx";
import {
  getElementsRequest,
  createElementRequest,
  deleteElementRequest,
  getElementRequest,
  updateElementRequest
} from "../api/elements.api.js";
import { useContext, useState } from "react";

export const useElement = () => {
  const context = useContext(ElementContext);
  if (!context) {
    throw new Error("Error in context");
  }
  return context;
};

export const ElementContextProvider = ({ children }) => {
  const [elements, setElements] = useState([]);

  //cargar Elements
  async function cargarElements() {
    const respues = await getElementsRequest();
    setElements(respues.data);
  }

  //createElement
  const createElement = async (Element) => {
    try {
      await createElementRequest(Element);
      //setCategories([...categories, respon.data]);
    } catch (error) {
      console.log(error);
    }
  };

  //Delete element
  const deleteElement = async (id) => {
    try {
      await deleteElementRequest(id);
      setElements(elements.filter((Element) => Element.id !== id));
      return null
    } catch (error) {
      return "DB error "
     
    }
  };

  //get one Element
  const getElement = async (id) => {
    try {
      const respon = await getElementRequest(id);
      return respon.data;
    } catch (error) {
      console.log(error);
    }
  };

  //update Element
  const updateElement = async (id, newFields) => {
    try {
      await updateElementRequest(id, newFields);
    } catch (error) {
      console.log(error);
    }
  };


  return (
    <ElementContext.Provider
      value={{
        cargarElements,
        elements,
        createElement,
        deleteElement,
        getElement,
        updateElement
      }}
    >
      {children}
    </ElementContext.Provider>
  );
};
