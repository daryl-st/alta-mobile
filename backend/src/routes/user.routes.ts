import { Router } from "express";
import { createUsers, getUsers } from "../controllers/user.controller.js";
import { AuthenticateToken } from "../middlewares/auth.middleware.js";

const router = Router();

// getUsers is controller function
router.get('/', AuthenticateToken, getUsers);
router.post('/', createUsers);

export default router;
