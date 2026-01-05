import { extendZodWithOpenApi } from "@asteasolutions/zod-to-openapi";
import { z } from "zod";

extendZodWithOpenApi(z);

export const createUserSchema = z.object({
  name: z.string().min(1, "Name is required").openapi({ example: "John Doe"}),
  email: z.string().email("Invalid email").openapi({ example: "m@example.com"}),
  password: z.string().min(8, "Password must be atleast 8 characters long.").openapi({ example: "*********"}),
}).openapi("User");

// TypeScript type inferred from schema
export type CreateUserInput = z.infer<typeof createUserSchema>; // we will return createUserSchema Type

export const userLoginSchema = z.object({
    email: z.string().email("Invalid email!").openapi({ example: "m@example.com"}),
    password: z.string().min(8, "Password too short").openapi({ example: "********"}),
});

export type UserLoginInput = z.infer<typeof userLoginSchema>;