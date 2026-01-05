import { OpenAPIRegistry } from "@asteasolutions/zod-to-openapi";
import { getUserSchema, updateUserSchema } from "../schemas/user.schema.js";

export function registerUserDocs(registry: OpenAPIRegistry) {
    registry.registerPath({
        method: "get",
        path: "/users/me",
        description: "Get user account",
        tags: ["User"],
        responses: {
            201: { 
                description: "User Date",
                content: {
                    "application/json": {
                        schema: getUserSchema
                    }
                } 
            },
            401: { description: "Bad Request" },
            404: { description: "User Not Found "},
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "put",
        path: "/users/me",
        description: "Update user account",
        tags: ["User"],
        request: {
            body: {
                content: {
                    "application/json": {
                        schema: updateUserSchema,
                    },
                },
            },
        },
        responses: {
            201: { 
                description: "Account Updated", 
                content: {
                    "application/json": {
                        schema: getUserSchema
                    }
                }
            },
            401: { description: "Bad Request" },
            404: { description: "User Not Found "},
            500: { description: "Internal Server Error" },
        }
    });
}