import type { Request, Response } from "express";
import { createUser, getUser } from "../services/user.service.js";
import { AppError } from "../middlewares/errorHandler.js";

export const getUsers = async (req: Request, res: Response) => {
  const userData = await getUser();

  // flexing our AppError Hanlder
  if (userData.length === 0) {
    throw new AppError("No users found", 404)
  }

  res.status(200).json({
    success: true,
    data: userData
  })
  
};

export const createUsers = async (req: Request, res: Response) => {
  const {name, email, password} = req.body;

  if (!email || !name) {
    throw new AppError("Email and name are required", 400);
  }

  const newUser = await createUser({ name, email, password});

  res.status(200).json({
    success: true,
    data: {
      name: newUser.name,
      email: newUser.email,
    }
  });
}