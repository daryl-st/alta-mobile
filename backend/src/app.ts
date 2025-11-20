import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import userRoute from "./routes/user.routes.js";
import authRouter from "./routes/auth.routes.js";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
  res.send("API is running...");
  console.log("Running");
});

app.use('/users', userRoute);
app.use('/auth', authRouter);

export default app;