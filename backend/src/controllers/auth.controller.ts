import type { Request, Response } from "express";
import { registerUser, loginUser } from "../services/auth.service.js";
import { generateDeviceId, generateToken, verifyRefreshToken } from "../utils/token.js";
import prisma from "../config/db.js";

export const signup = async (req: Request, res: Response) => {
    try {
        const { name, email, password } = req.body;

        if (!name || !email || !password) {
            return res.status(400).json({ message: "All Fields are Required! "});
        }

        // check existing user ??

        // call the register user funciton in service to register in the DB
        const { token, newUser } = await registerUser(name, email, password);

        const { accessToken, refreshToken } = generateToken(newUser);
        const deviceId = generateDeviceId();

        const userAgent = req.headers['user-agent'];
        const ipAddress = req.ip || req.connection.remoteAddress;

        const expiresAt = new Date();
        expiresAt.setDate(expiresAt.getDate() + 7);

        // refactor
        await prisma.refreshToken.create({
            data: {
                token: refreshToken,
                userId: newUser.id,
                deviceId,
                userAgent,
                ipAddress,
                expiresAt
            }
        })

        res.status(200).json({
            success: true,
            message: "User registred succesfully!",
            data: {
                user: { id: newUser.id, name: newUser.name, email: newUser.email },
                tokens : {
                    accessToken,
                    refreshToken,
                    deviceId
                }
            }
        });
    } catch (err) {
        console.error("User registration failed:", err);
        res.status(500).json({ 
            success: false,
            message: "Internal Server Error" + err, 
            // error: err instanceof Error ? err.message : err 
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

        const { accessToken, refreshToken } = generateToken(user);
        const deviceId = generateDeviceId();

        const userAgent = req.headers['user-agent'];
        const ipAddress = req.ip || req.connection.remoteAddress;

        const expiresAt = new Date();
        expiresAt.setDate(expiresAt.getDate() + 7);

        // refactor
        await prisma.refreshToken.create({
            data: {
                token: refreshToken,
                userId: user.id,
                deviceId,
                userAgent,
                ipAddress,
                expiresAt
            }
        })

        res.status(200).json({
            success: true,
            message: "Loggin in succesfully!",
            data: {
                user: {
                    id: user.id, name: user.name, email: user.email,
                },
                tokens: {
                    accessToken,
                    refreshToken,
                    deviceId,
                }
            }
        });
    } catch (err) {
        console.error("User registration failed:", err);
        res.status(500).json({ 
            success: false,
            message: "Internal Server Error:" + err, 
            // error: err instanceof Error ? err.message : err 
        });
    }

    const refresh = async (req: Request, res: Response) => {
        try {
            const { refreshToken, deviceId } = req.body;

            if (!refreshToken || !deviceId) {
                return res.status(400).json({
                    success: false,
                    message: "Refresh token and device ID required"
                });
            }

            // verify refresh token 
            const decoded = verifyRefreshToken(refreshToken);
            if (!decoded) {
                return res.status(401).json({
                    success: false,
                    message: "Invalid refresh token"
                });
            }

            // check if token exists in db
            const tokenRecord = await prisma.refreshToken.findFirst({
                where: {
                    token: refreshToken,
                    deviceId,
                    isValid: true,
                    expiresAi: { gt: new Date() }
                },
                include: { user: true }
            });

            if (!tokenRecord) {
                return res.status(401).json({
                    success: false,
                    message: "Refresh token not found or expired"
                });
            }

            const { accessToken, refreshToken: newRefreshToken } = generateToken(tokenRecord.user);
            const newDeviceId = generateDeviceId();

            // invalidate old tokens
            await prisma.refreshToken.update({
                where: {id: tokenRecord.id},
                data: { isValid: false }
            });

            const expiresAt = new Date();
            expiresAt.setDate(expiresAt.getDate() + 7);

            await prisma.refreshToken.create({
                data: {
                    token: newRefreshToken,
                    userId: tokenRecord.userId,
                    deviceId: newDeviceId,
                    userAgent: tokenRecord.userAgent,
                    ipAddress: tokenRecord.ipAddress,
                    expiresAt,
                }
            })

            res.json({
                success: true,
                data: {
                    tokens: {
                        accessToken,
                        refreshToken: newRefreshToken,
                        deviceId: newDeviceId,
                    }
                }
            });
        } catch (err: any) {
            res.status(500).json({
                success: false,
                message: "Token refresh failed",
                error: err.message
            })
        }
    }
}