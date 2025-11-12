import { z } from "zod";

export const createUserSchema = z.object({
  name: z.string().min(1, "Name is required"),
  email: z.string().email("Invalid email"),
});

// TypeScript type inferred from schema
export type CreateUserInput = z.infer<typeof createUserSchema>; // we will return createUserSchema Type
