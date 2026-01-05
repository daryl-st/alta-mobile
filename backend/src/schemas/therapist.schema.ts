import { extendZodWithOpenApi } from "@asteasolutions/zod-to-openapi";
import { getUserSchema } from "./user.schema.js";
import { z } from "zod";

extendZodWithOpenApi(z);

export const getTherapistSchema = getUserSchema.extend({
    bio: z.string().openapi({ example: "A simple bio for the therapist"}),
    experience: z.int().openapi({ example: 5}),
}).openapi("Therapist");

export type TherapistSchemaInput = z.infer<typeof getTherapistSchema>;

export const therapistArraySchema = getTherapistSchema.array().openapi({ example: "Get All Therapist."})

export type ServiceSchemaArrayInput = z.infer<typeof therapistArraySchema>;

export const getAvailabilitySchema = z.object({
    day_of_the_week: z.int().openapi({ example: 3 }), // day-of-the-week
    therapist_id: z.int().openapi({ example: "Therapist ID"}), // change this to uuid later
    start_time: z.int().openapi({ example: "8:00"}), // add time validation
    end_time: z.int().openapi({ example: "10:00"}), // add time validation
}).openapi("Availablility");

export type AvailablilitySchema = z.infer<typeof getAvailabilitySchema>;