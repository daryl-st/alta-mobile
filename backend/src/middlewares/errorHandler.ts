import type { Request, Response, NextFunction } from "express";

export default function errorHandler(err: any, req: Request, res: Response, next: NextFunction) {
    // Default values if not provided (500)
    const statusCode = err.statusCode || 500;
    const message = err.message || "Something went wrong!";

    // Operational Errors (AppError)
    if (err.isOperational) {
        return res.status(statusCode).json({
            success: false,
            message
        })
    }

    // Programming / Unknown Errors
    console.error("UNEXPECTED ERROR: ", err);

    return res.status(500).json({
        success: false,
        message: "Internal Server Error!"
    })
};

// custom AppError
export class AppError extends Error {
    public statusCode: number;
    public isOperational: boolean;

    constructor(message: string, statusCode: number) {
        super(message);

        this.statusCode = statusCode;
        this.isOperational = true;

        Error.captureStackTrace(this, this.constructor);
    }
};

// Async Wrapper (catchAsync)
export const catchAsync = (fn: Function) => {
    return (req: any, res: any, next: any) => {
        Promise.resolve(fn(req, res, next)).catch(next); // goes straight to the global handler
    };
};