import { OpenAPIRegistry } from "@asteasolutions/zod-to-openapi";
import { createEventSchema, updateEventSchema, eventsArray, eventRegisteration } from "../schemas/event.schema.js";
import { z } from "zod";

export function registerEventsDocs(registry: OpenAPIRegistry) {
    registry.registerPath({
        method: "get",
        path: "/events",
        description: "Get a list of all events",
        tags: ["Events"],
        responses: {
            200: { 
                description: "Event List", 
                content: {
                    "application/json": {
                        schema: eventsArray,
                    }
                }
            },
            401: { description: "Bad Request" },
            404: { description: "Not Found "},
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "get",
        path: "/events/{id}",
        description: "Get event detail",
        tags: ["Events"],
        request: {
            params: z.object({ id: z.string() })
        },
        responses: {
            200: { 
                description: "Event Detail", 
                content: {
                    "application/json": {
                        schema: eventsArray,
                    }
                }
            },
            401: { description: "Bad Request" },
            404: { description: "Not Found "},
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "post",
        path: "/events/{id}/register",
        description: "Register to an event",
        tags: ["Events"],
        request: {
            params: z.object({ id: z.number() }),
            body: {
                content: {
                    "application/json": {
                        schema: eventRegisteration
                    }
                }
            }
        },
        responses: {
            200: { description: "Successfully Registered" },
            401: { description: "Bad Request" },
            404: { description: "Not Found "},
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "get",
        path: "/events/register/me",
        description: "List of events user registered.",
        tags: ["Events"],
        responses: {
            200: { 
                description: "Successfully Registered",
                content: {
                    "application/json": {
                        schema: eventsArray // it doesn't need to return the whole array only user registered
                    }
                },
            },
            401: { description: "Bad Request" },
            404: { description: "Not Found "},
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "post",
        path: "/events/register/{id}/cancel",
        description: "cancel event",
        tags: ["Events"],
        request: {
            body: {
                content: {
                    "application/json": {
                        schema: createEventSchema // will be changed to only id we don need this whole data
                    }
                }
            }
        },
        responses: {
            200: { description: "Successfully Cancelled" },
            401: { description: "Bad Request" },
            404: { description: "Not Found "},
            500: { description: "Internal Server Error" },
        }
    });
}