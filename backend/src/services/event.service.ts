import prisma from "../config/db.js";
import { AppError } from "../middlewares/errorHandler.js";
import { getUserByEmail } from "./user.service.js";

export const getEvents = async () => {
    // get all events
    const events = await prisma.event.findMany({
        select: {
            title: true,
            desc: true,
            price: true,
            capacity: true,
            location: true,
            start_time: true,
            end_time: true,
        },
    });

    return events;
};

export const getEventById = async (id: number) => {
    const event = await prisma.event.findUnique({
        where: { id: id },
        select: {
            title: true,
            desc: true,
            price: true,
            capacity: true,
            location: true,
            start_time: true,
            end_time: true,
        },
    });

    return event;
};

export const registerEvent = async (
    eventId: number,
    clientId: number,
    email: string,
) => {
    // get user info from name and email
    const userId = await getUserByEmail(email);

    if (userId == null) {
        throw new AppError("User Not Found", 404);
    }

    const register = await prisma.eventAttendee.create({
        data: {
            event_id: eventId,
            user_id: clientId, // we can't use this we need to figure out a way to infer the info some other way
        },
    });

    return register;
};

// Will be implemented later
// export const cancelEvent = async (eventId: number, clientId: number) => {
//     const event = await prisma.eventAttendee.findUnique({
//         where: { event_id: eventId },
//         select: {
//             event_id: true,
//             user_id: true,
//         },
//     });
// };
