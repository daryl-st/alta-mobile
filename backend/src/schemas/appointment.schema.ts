import { extendZodWithOpenApi } from "@asteasolutions/zod-to-openapi";
import { z } from "zod";

extendZodWithOpenApi(z);

export const bookAppointmentSchema = z.object({
    client_id: z.string().openapi({ example: "The ID of the client doing the booking"}),
    service_id: z.string().openapi({ example: "The ID of the service"}),
    start_time: z.date().openapi({ example: "12-04-24"}), // not sure when i need it tho ;/
    end_time: z.date().openapi({ example: "12-04-24"}),
    status: z.string().openapi({ example: "PENDING"}),
}).openapi("Appointment");

export type AppointmentSchema = z.infer<typeof bookAppointmentSchema>;

export const appointmentArraySchema = bookAppointmentSchema.array().openapi({ example: "Get All Appointments"});

export type AppointmentArraySchema = z.infer<typeof appointmentArraySchema>;