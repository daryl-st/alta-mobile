import { extendZodWithOpenApi } from "@asteasolutions/zod-to-openapi";
import { z } from "zod";

extendZodWithOpenApi(z);

export const getServiceSchema = z.object({
    name: z.string().openapi({ description: "Service Name" }),
    description: z.string().openapi({ description: "Service Description"}),
    duration: z.int().openapi({ description: "60 Mins (only the number)"}),
    price: z.int().openapi({ description: "150$"}),
    is_active: z.boolean().openapi({ example: true })
}).openapi("Service");

export type ServiceSchemaInput = z.infer<typeof getServiceSchema>;

export const serviceArraySchema = getServiceSchema.array().openapi({ example: "Get All Services."})

export type ServiceSchemaArrayInput = z.infer<typeof serviceArraySchema>;