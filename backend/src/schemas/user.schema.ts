import { extendZodWithOpenApi } from "@asteasolutions/zod-to-openapi";
import { email, z } from "zod";

extendZodWithOpenApi(z);

export const getUserSchema = z.object({
  name: z.string().min(1, "Name is required").openapi({ example: "John Doe"}),
  email: z.string().email("Invalid email").openapi({ example: "m@example.com"}),
  role: z.string().openapi({ example: "CLIENT"}),
}).openapi("User");

// TypeScript type inferred from schema
export type CreateUserInput = z.infer<typeof getUserSchema>; // we will return createUserSchema Type

export const updateUserSchema = z.object({
  name: z.string().optional().openapi({ example: "Jon Doe"}),
  email: z.string().optional().openapi({ example: "m@example.com" }),
}).openapi("User");

export type UpdateUserInput = z.infer<typeof updateUserSchema>;