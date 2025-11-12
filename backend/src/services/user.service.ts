import prisma from "../config/db.js";

export const getUser = async () => { // i dont need to deal with HTTP requests here
    // const users = await prisma.users.findMany({
    //     take: 50, // how many data
    //     select: { //  i can choose which variable i want to send/display
    //         fname: true,
    //         email: true,
    //     },
    // });

    const users = await prisma.users.findMany({
        select: {
            name: true,
            email: true,
        }
    });

    return users;
}

export const createUser = async (userData: { fname: string, email: string, password: string }) => {
    const user = await prisma.users.create({
        data: { 
            name: userData.fname, 
            email: userData.email, 
            password: userData.password 
        }
    });

    return user;
}