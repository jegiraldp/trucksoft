import axios from "axios";

export const getElementsRequest = async () =>
  await axios.get("http://localhost:3000/elements");

export const createElementRequest = async (element) =>
  await axios.post("http://localhost:3000/elements", element);
