import { OpenAPIRegistry, OpenApiGeneratorV3, extendZodWithOpenApi } from "@asteasolutions/zod-to-openapi";
import { registerAuthDocs } from "./auth.openapi.js";
import { registerUserDocs } from "./user.openapi.js";
import { registerEventsDocs } from "./event.openapi.js";
import { registerServiceDocs } from "./service.openapi.js";
import { registerTherapistDocs } from "./therapist.openapi.js";
import { registerAppointmentDocs } from "./appointment.openapi.js";
import { z } from "zod"

extendZodWithOpenApi(z);

const registry = new OpenAPIRegistry();

registerAuthDocs(registry);
registerUserDocs(registry);
registerEventsDocs(registry);
registerServiceDocs(registry);
registerTherapistDocs(registry);
registerAppointmentDocs(registry);

export const openApiDocument = new OpenApiGeneratorV3(registry.definitions).generateDocument({
  openapi: '3.0.0',
  info: { title: 'Alta API', version: '1.0.0' },
});