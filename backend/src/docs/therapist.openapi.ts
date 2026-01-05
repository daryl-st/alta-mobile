import { OpenAPIRegistry } from "@asteasolutions/zod-to-openapi";
import { therapistArraySchema, getTherapistSchema, getAvailabilitySchema } from "../schemas/therapist.schema.js";
import { z } from "zod";

export function registerTherapistDocs(registry: OpenAPIRegistry) {
    registry.registerPath({
        method: "get",
        path: "/therapists",
        description: "Get a list of all therapist",
        tags: ["Therapist"],
        responses: {
            200: { 
                description: "Therapist List", 
                content: {
                    "application/json": {
                        schema: therapistArraySchema,
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
        path: "/therapist/[therapistUserId]",
        description: "Get specific therapist Detail (Therapist Dashboard)",
        tags: ["Therapist"],
        request: {
            params: z.object({ therapistUserId: z.string() })
        },
        responses: {
            200: { 
                description: "Therapist Profile",
                content: {
                    "application/json": {
                        schema: getTherapistSchema,
                    }
                } 
            },
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "put",
        path: "/therapist/me/profile",
        description: "Update Therapist Profile",
        tags: ["Therapist"],
        request: {
            body: {
                content: {
                    "application/json": {
                        schema: getTherapistSchema, // need separate update schema with optional fields ??
                    }
                }
            }
        },
        responses: {
            200: { 
                description: "Therapist Profile",
                content: {
                    "application/json": {
                        schema: getTherapistSchema,
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
        path: "/therapist/{id}/availablity",
        description: "Get therapist availability",
        tags: ["Therapist"],
        request: {
            params: z.object({ therapistUserId: z.string() })
        },
        responses: {
            200: { 
                description: "Therapist Availability",
                content: {
                    "application/json": {
                        schema: getAvailabilitySchema,
                    }
                } 
            },
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });

    // put (update) availability to be implemented once the schema is finished
    registry.registerPath({
        method: "put",
        path: "/therapist/me/availablity",
        description: "Update therapist availability",
        tags: ["Therapist"],
        request: {
            body: {
                content: {
                    "application/json": {
                        schema: getAvailabilitySchema // need separate update schema with optional fields ??
                    }
                }
            }
        },
        responses: {
            200: { 
                description: "Therapist Availability",
                content: {
                    "application/json": {
                        schema: getAvailabilitySchema,
                    }
                } 
            },
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    });
}