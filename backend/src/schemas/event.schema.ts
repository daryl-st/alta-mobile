import { extendZodWithOpenApi } from "@asteasolutions/zod-to-openapi";
import { z } from "zod";

extendZodWithOpenApi(z);

export const createEventSchema = z.object({
    title: z.string().openapi({ example: "Event title"}),
    description: z.string().openapi({ example: "Event Description "}),
    price: z.int().openapi({ example: "15$"}),
    capacity: z.int().default(100).openapi({ example: 100}),
    location: z.string().openapi({ example: "AA. King George St."}),
    start_time: z.string().openapi({ example: "8:00"}),
    end_time: z.string().openapi({ example: "10:00"}), // validate using real time validator
}).openapi("Event");

export type EventSchema = z.infer<typeof createEventSchema>;

export const updateEventSchema = z.object({ // not used, is it neccessary ??
    description: z.string().optional().openapi({ example: "Event Description "}),
    price: z.int().optional().openapi({ example: "15$"}),
    capacity: z.int().optional().default(100).openapi({ example: 100}),
    location: z.string().optional().openapi({ example: "AA. King George St."}),
    start_time: z.string().optional().openapi({ example: "8:00"}),
    end_time: z.string().optional().openapi({ example: "10:00"}), // validate using real time validator
});

export type UpdateEventSchema = z.infer<typeof updateEventSchema>;

export const eventsArray = createEventSchema.array().openapi({ example: "Array of Events"});

export type EventsArray = z.infer<typeof updateEventSchema>;

export const eventRegisteration = z.object({
    name: z.string().openapi({ example: "John Doe" }),
    email: z.email().openapi({ example: "m@example.com" }),
})

export type EventRegisteration = z.infer<typeof eventRegisteration>;