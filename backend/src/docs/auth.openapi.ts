import { OpenAPIRegistry } from "@asteasolutions/zod-to-openapi";
import { createUserSchema, userLoginSchema } from "../schemas/auth.schema.js";

export function registerAuthDocs(registry: OpenAPIRegistry) {
    registry.registerPath({
        method: "post",
        path: "/register",
        description: "Create user account",
        tags: ["Auth"],
        request: {
            body: {
                content: {
                    "application/json": {
                        schema: createUserSchema,
                    },
                },
            },
        },
        responses: {
            201: { description: "Account Created", },
            401: { description: "Bad Request" },
            500: { description: "Internal Server Error" },
        }
    });

    registry.registerPath({
        method: "post",
        path: "/login",
        description: "User Login in",
        tags: ["Auth"],
        request: {
            body: {
                content: {
                    "application/json": {
                        schema: userLoginSchema,
                    },
                },
            },
        },
        responses: {
            200: { description: "Login Successful" },
            400: { description: "Bad Request" },
            500: { description: "Internal Server Error" },
        }
    })

    // Logout will be implemented
}