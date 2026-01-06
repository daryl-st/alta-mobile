import prisma from "../config/db.js";

export const getUser = async () => {
    // this function should only responsible for getting the currently signed user to display the dashboard.
    const users = await prisma.user.findMany({
        where: { role: "CLIENT" },
        select: {
            name: true,
            email: true,
            password: true,
        }
    });

    return users;
}

// let's have getUserByEmail function here for the event; here coz organizaiton
export const getUserByEmail = async (email: string) => {
    const userId = await prisma.user.findUnique({ // since email and id are the only one's that are unique
        where: { email: email },
        select: {
            id: true,
        }
    });

    return userId;
}

export const createUser = async (userData: { name: string, email: string, password: string }) => {
    const user = await prisma.user.create({
        data: { 
            name: userData.name, 
            email: userData.email, 
            password: userData.password 
        }
    });

    return user;
}