import { OpenAPIRegistry } from "@asteasolutions/zod-to-openapi";
import { serviceArraySchema, getServiceSchema } from "../schemas/service.schema.js";
import { z } from "zod";

export function registerServiceDocs(registry: OpenAPIRegistry) {
    registry.registerPath({
        method: "get",
        path: "/services",
        description: "Get Services",
        tags: ["Service"],
        responses: {
            201: { 
                description: "Services Data", 
                content: {
                    "application/json": {
                        schema: serviceArraySchema,
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
        path: "/services/{id}",
        description: "Service Detail Page",
        tags: ["Service"],
        request: {
            params: z.object({ id: z.string() })
        },
        responses: {
            200: { 
                description: "Single Service",
                content: {
                    "application/json": {
                        schema: getServiceSchema
                    }
                }
            },
            400: { description: "Bad Request" },
            404: { description: "Not Found" },
            500: { description: "Internal Server Error" },
        }
    })
}