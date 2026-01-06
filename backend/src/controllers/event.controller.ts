import type { Request, Response } from "express";
import { registerEvent, getEvents, getEventById } from "../services/event.service.js";
import { AppError } from "../middlewares/errorHandler.js";

export const getEventsController = async (req: Request, res: Response) => {
    const events = await getEvents();

    if (events.length === 0) {
        throw new AppError("No events found", 404);
    }

    res.status(200).json({
        success: true,
        data: events,
    })
} 

export const getEventByIdController = async (req: Request, res: Response) => {
    const id = (req.params.id) as unknown; // has to be modified later
    const eventId = Number(id);
    const event = await getEventById(eventId);

    if (!event) {
        throw new AppError("Event not found", 404);
    }

    res.status(200).json({
        success: true,
        data: event,
    });
}

export const registerEventController = async (req: Request, res: Response) => {
    const id = (req.params.id) as unknown;
    const eventId = Number(id);

    const body = req.body;

    const clientId = body.id;
    const email = body.email;

    console.log(email, clientId, eventId);
    const register = await registerEvent(eventId, clientId, email); // needs to modified later

    res.status(200).json({
        success: true,
        data: register,
    })
}