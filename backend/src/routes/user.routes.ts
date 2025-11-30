import { Router } from "express";
import { createUsers, getUsers } from "../controllers/user.controller.js";
import { AuthenticateToken } from "../middlewares/auth.middleware.js";
import { catchAsync } from "../middlewares/errorHandler.js";

const router = Router();

// getUsers is controller function
router.get('/', AuthenticateToken, catchAsync(getUsers));
router.post('/', catchAsync(createUsers));

export default router;
