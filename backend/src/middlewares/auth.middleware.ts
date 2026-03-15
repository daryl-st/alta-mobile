import type { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";
import { verifyAccessToken } from "../utils/token.js";

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

    const decoded = verifyAccessToken(token);

    if (!decoded) {
        return res.status(401).json({
            success: false,
            message: "Invalid or expired token"
        });
    }

    // if there is token we will verify it
    jwt.verify(token, JWT_SECRET, (err, user) => {
        if (err) return res.status(403).json({ message: "Invalid token." });

        req.user = user; // if succesful, attach it to the user
        next();
    })
} 