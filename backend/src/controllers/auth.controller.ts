import type { Request, Response } from "express";
import { registerUser, loginUser } from "../services/auth.service.js";

export const signup = async (req: Request, res: Response) => {
    try {
        const { name, email, password } = req.body;

        if (!name || !email || !password) {
            return res.status(400).json({ message: "All Fields are Required! "});
        }

        // call the register user funciton in service to register in the DB
        const { token, newUser } = await registerUser(name, email, password);

        res.status(200).json({
            message: "User registred succesfully!",
            token,
            user: { id: newUser.id, name: newUser.name, email: newUser.email },
        });
    } catch (err) {
        console.error("User registration failed:", err);
        res.status(500).json({ 
            message: "Internal Server Error", error: err instanceof Error ? err.message : err 
        });
    }
};

export const login = async (req: Request, res: Response) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) {
            return res.status(400).json({ message: "All fields are Required! "});
        }

        // call the login function in service to login and generate token
        const { token, user } = await loginUser(email, password);

        res.status(200).json({
            message: "Loggin in succesfully!",
            token,
            user: {
                id: user.id, name: user.name, email: user.email,
            }
        });
    } catch (err) {
        console.error("User registration failed:", err);
        res.status(500).json({ 
            message: "Internal Server Error", error: err instanceof Error ? err.message : err 
        });
    }
}