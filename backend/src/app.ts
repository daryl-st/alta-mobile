import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import userRoute from "./routes/user.routes.js";
import authRouter from "./routes/auth.routes.js";
import eventRouter from "./routes/event.routes.js";
import errorHandler from "./middlewares/errorHandler.js";
import swaggerUi from "swagger-ui-express";
import { openApiDocument  } from "./docs/openapi.js";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());

app.use("/docs", swaggerUi.serve, swaggerUi.setup(openApiDocument));

app.get("/", (req, res) => {
    res.send("API is running...");
});

app.use('/users', userRoute);
app.use('/auth', authRouter);
app.use('/events', eventRouter);

app.use(errorHandler);

export default app;