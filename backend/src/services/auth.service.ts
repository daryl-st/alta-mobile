import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import prisma from "../config/db.js";
import dotenv from 'dotenv';

dotenv.config();

const JWT_SECRET = process.env.JWT_SECRET as string;
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN as string;

export const registerUser = async (name: string, email: string, password: string) => {
    // if email exists
    const existingUser = await prisma.users.findUnique({ where: {email} });
    if (existingUser) throw new Error("Email Already Exist");

    // hash password
    const hasedPass = await bcrypt.hash(password, 10);

    // create new user
    const newUser = await prisma.users.create({
        data: { name, email, password: hasedPass }
    });

    // generate token
    const token = jwt.sign({ userID: newUser.id, email: newUser.email}, JWT_SECRET, {
        expiresIn: JWT_EXPIRES_IN,
    } as jwt.SignOptions);

    return { token, newUser };
};

export const loginUser = async (email: string, password: string) => {
    // check user email exists
    const user = await prisma.users.findUnique({ where: { email } });
    if (!user) throw new Error("Invalid email or password!");

    // check password
    const isPassValid = await bcrypt.compare(password, user.password);
    if (!isPassValid) throw new Error("Invalid email or password!");

    // generate token
    const token = jwt.sign({ userID: user.id, email: user.email}, JWT_SECRET, {
        expiresIn: JWT_EXPIRES_IN,
    } as jwt.SignOptions);

    return { token, user };
}