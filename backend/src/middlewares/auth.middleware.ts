import type { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

const JWT_SECRET = process.env.JWT_SECRET as string;

export interface AuthRequest extends Request {
    user?: any;
}

export const AuthenticateToken = (req: AuthRequest, res: Response, next: NextFunction) => {
    // we need to extract the header b/c it contains the token.
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) return res.status(401).json({
        message: "Access Denied. No token Provided"
    });

    // if there is token we will verify it
    jwt.verify(token, JWT_SECRET, (err, user) => {
        if (err) return res.status(403).json({ message: "Invalid token." });

        req.user = user; // if succesful, attach it to the user
        next();
    })
} 