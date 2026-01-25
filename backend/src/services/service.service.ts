import prisma from "../config/db.js";

export const getServices = async () => {
    const services = await prisma.service.findMany({
        select: {
            name: true,
            desc: true,
            duration: true,
            price: true,
            is_active: true,
        },
    });

    return services;
};

export const getServiceById = async (serviceId: number) => {
    const service = await prisma.service.findUnique({
        where: { id: serviceId },
        select: {
            name: true,
            desc: true,
            duration: true,
            price: true,
            is_active: true,
        },
    });

    return service;
};
