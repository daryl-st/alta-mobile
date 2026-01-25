import { Router } from "express";
import { catchAsync } from "../middlewares/errorHandler.js";
import {
    getService,
    getServicesController,
} from "../controllers/service.controller.js";

const router = Router();
router.get("/", catchAsync(getServicesController));
router.get("/:id", catchAsync(getService));

export default router;
