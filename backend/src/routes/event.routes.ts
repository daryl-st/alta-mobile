import { Router } from "express";
import { getEventsController, registerEventController, getEventByIdController } from "../controllers/event.controller.js";
// import { AuthenticateToken } from "../middlewares/auth.middleware.js";
import { catchAsync } from "../middlewares/errorHandler.js";

const router = Router();

// getUsers is controller function
// router.get('/', AuthenticateToken, catchAsync(getUsers)); // we don't need the autorization middleware
router.get('/', catchAsync(getEventsController));
router.get('/:id', catchAsync(getEventByIdController));
router.post('/:id/register', catchAsync(registerEventController));

export default router;
