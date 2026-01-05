import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    const client = await prisma.user.upsert({
        where: { email: "client@alta.test"},
        update: {},
        create: {
            name: "John Doe",
            email: "client@alta.test",
            password: "12345678",
            role: "CLIENT",
        }
    });

    const therapist = await prisma.user.upsert({
        where: { email: "therapist@alta.test" },
        update: {},
        create: {
            name: "Lucy Maine",
            email: "Therapist@alta.test",
            password: "12345678",
            role: "THERAPIST",
        }
    })

    const therapistProfile = await prisma.therapist.upsert({
        where: { user_id: therapist.id },
        update: {},
        create: {
            bio: "Specialized in Mental Health",
            experience: 4,
            user_id: therapist.id,
        },
    });

    const services = await prisma.service.upsert({
        where: { id: 101 },
        update: {},
        create: {
            name: "Mental Health",
            desc: "Mental Health Service Page",
            duration: 60,
            price: 150,
            is_active: true,
            therapist_id: therapist.id,
        },
    });

    const availability = await prisma.availability.upsert({
        where: { id: 110 },
        update: {},
        create: {
            day_of_week: 3,
            start_time: 10,
            end_time: 12,
            therapist_id: therapist.id,
        },
    });

    const appointment = await prisma.appointment.upsert({
        where: { id: 110 },
        update: {},
        create: {
            service_id: services.id,
            availability_id: availability.id,
            status: "PENDING",
            start_time: 8,
            end_time: 10,
            client_id: client.id,
        }
    });

    const event = await prisma.event.upsert({
        where: { id: 110 },
        update: {},
        create: {
            title: "Mental Health Event",
            desc: "Event about mental health in-person",
            price: 15,
            capacity: 60,
            location: "King George IV street, Addis Ababa",
            start_time: 10,
            end_time: 12,
        },
    });
}

console.log("Seed Complete!");
console.log("Client: client@alta.test / 12345678 ");
console.log(`Created ${await prisma.service.count()} services`);
console.log(`Created ${await prisma.availability.count()} slots`);
console.log(`Created ${await prisma.event.count()} Events`);

main()
    .catch((e) => {
        console.error(e);
    })
    .finally(async () => {
        await prisma.$disconnect();
    })