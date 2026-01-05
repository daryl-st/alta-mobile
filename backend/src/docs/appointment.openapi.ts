import { OpenAPIRegistry } from "@asteasolutions/zod-to-openapi";
import { bookAppointmentSchema, appointmentArraySchema } from "../schemas/appointment.schema.js";
import { z } from "zod";

export function registerAppointmentDocs(registry: OpenAPIRegistry) {
    registry.registerPath({
        method: "post",
        path: "/appointments",
        description: "Book an appointment",
        tags: ["Appointments"],
        request: {
            body: {
                content: {
                    "application/json": {
                        schema: bookAppointmentSchema,
                    }
                }
            }
        },
        responses: {
            201: { 
                description: "Successfully Booked", 
                content: {
                    "application/json": {
                        schema: bookAppointmentSchema,
                    }
                } 
            },
            401: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "get",
        path: "/appointments/me",
        description: "Get All Users Appointments",
        tags: ["Appointments"],
        responses: {
            200: { 
                description: "Appointment List (Client)",
                content: {
                    "application/json": {
                        schema: appointmentArraySchema
                    }
                }
            },
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "get",
        path: "/appointments/therapist/me",
        description: "Get All Therapist Appointments",
        tags: ["Appointments"],
        responses: {
            200: { 
                description: "Appointment List (Therapist)",
                content: {
                    "application/json": {
                        schema: appointmentArraySchema
                    }
                }
            },
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });   

    registry.registerPath({
        method: "get",
        path: "/appointments/{id}",
        description: "Get Appointment Detail",
        tags: ["Appointments"],
        request: {
            params: z.object({ id: z.string() }),
        },
        responses: {
            200: { 
                description: "Appointment Detail",
                content: {
                    "application/json": {
                        schema: bookAppointmentSchema
                    }
                }
            },
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });   

    registry.registerPath({
        method: "post",
        path: "/appointments/{id}/cancel",
        description: "Cancel Appointment",
        tags: ["Appointments"],
        request: {
            params: z.object({ id: z.string() }),
        },
        responses: {
            200: { description: "Appointment Cancelled."},
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });  
}