import { ElementContext } from "./TheContext.jsx";
import {
  getElementsRequest,
  createElementRequest,
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

  return (
    <ElementContext.Provider
      value={{
        cargarElements,
        elements,
        createElement,
      }}
    >
      {children}
    </ElementContext.Provider>
  );
};
