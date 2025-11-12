// // src/config/db.ts
// import { PrismaClient } from "@prisma/client";

// let prisma: PrismaClient;

// export function getPrisma(): PrismaClient {
//   if (!prisma) {
//     prisma = new PrismaClient({ log: ["query"] });
//   }
//   return prisma;
// }


// src/config/db.ts
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
export default prisma;
