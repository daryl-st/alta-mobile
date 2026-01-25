import type { Request, Response } from "express";
import { getServiceById, getServices } from "../services/service.service.js";
import { AppError } from "../middlewares/errorHandler.js";

export const getServicesController = async (req: Request, res: Response) => {
    const services = await getServices();

    if (services.length == 0) {
        throw new AppError("No Service found", 404);
    }

    res.status(200).json({
        success: true,
        data: services,
    });
};

export const getService = async (req: Request, res: Response) => {
    const id = req.params.id as any;
    const serviceId = Number(id);
    const service = await getServiceById(serviceId);

    if (!service) {
        throw new AppError("Service not found", 404);
    }

    res.status(200).json({
        success: true,
        data: service,
    });
};
