import express from "express";
import cors from "cors";
import { PORT } from "./config.js";
import indexRoutes from "./routes/index.routes.js";
import categoriesRoutes from "./routes/categories.routes.js";
import elementsRoutes from "./routes/elements.routes.js";
import personsRoutes from "./routes/persons.routes.js";
import conceptstypeRoutes from "./routes/conceptstype.routes.js";
import payrollsRoutes from "./routes/payrolls.routes.js";
import conceptsRoutes from "./routes/concepts.routes.js";
import vehiculestypeRoutes from "./routes/vehiculestype.routes.js";
import vehiculesRoutes from "./routes/vehicules.routes.js";
import schedulesRoutes from "./routes/schedules.routes.js";
import budgetsRoutes from "./routes/budgets.routes.js";

const app = express();
//const __dirname = dirname(fileURLToPath(import.meta.url))
app.use(cors());
app.use(express.json());
app.use(indexRoutes);
app.use(categoriesRoutes);
app.use(elementsRoutes);
app.use(personsRoutes);
app.use(conceptstypeRoutes);
app.use(payrollsRoutes);
app.use(conceptsRoutes);
app.use(vehiculestypeRoutes);
app.use(vehiculesRoutes);
app.use(schedulesRoutes);
app.use(budgetsRoutes);

//app.use(express.static(join(__dirname, '../clienteTareas/dist')))

app.listen(PORT);
console.log("Server Running on port " + PORT);