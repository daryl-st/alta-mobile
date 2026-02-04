import prisma from "../config/db.js";

export const getTherapist = async () => {
    const therapists = await prisma.user.findMany({
        where: {
            role: "THERAPIST",
        },
        select: {
            name: true,
            email: true,
        },
    });

    return therapists;
};

export const getTherapistInfo = async (id: any) => {
    const therapistDetail = await prisma.therapist.findUnique({
        where: {
            user_id: id,
        },
        select: {
            user_id: true,
            bio: true,
            experience: true,
        },
    });

    return therapistDetail;
};

export const getTherapistById = async (id: any) => {
    const therapist = await prisma.user.findUnique({
        where: { id: id },
        select: {
            name: true,
            email: true,
        },
    });

    return therapist;
};

export const updateTherapistProfile = async (email: string, name: string) => {
    const therapist = await prisma.user.update({
        where: { email: email },
        data: {
            name: name,
        },
    });

    return therapist;
};

// TODO: I guess it's better to modify this when doing the UI and gain clear requirements of the client!
