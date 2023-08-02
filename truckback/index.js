import express from "express";
import { PORT } from "./config.js";
import indexRoutes from "./routes/index.routes.js";

const app = express();
//const __dirname = dirname(fileURLToPath(import.meta.url))
//app.use(cors());
app.use(express.json());
app.use(indexRoutes);
//app.use(tareasRoutes);
//app.use(express.static(join(__dirname, '../clienteTareas/dist')))

app.listen(PORT);
console.log("Server Running on port " + PORT);