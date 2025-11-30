import express from "express";
import { signup, login } from "../controllers/auth.controller.js";
import { catchAsync } from "../middlewares/errorHandler.js";

const router = express.Router();

// POST /api/auth/signup
router.post('/signup', catchAsync(signup));

// POST /api/auth/login
router.post('/login', catchAsync(login));

export default router;