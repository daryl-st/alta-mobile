import type { Request, Response } from "express";
import { createUser, getUser } from "../services/user.service.js";

export const getUsers = async (req: Request, res: Response) => {
  try {
    const userData = await getUser();

    return res.status(200).json({
      data: userData
    })
  } catch (err) {
    res.status(500).json({
      message: "Internal Server Error."
    });
  }
};

export const createUsers = async (req: Request, res: Response) => {
  try {
    const { fname, email, password } = req.body;

    // validated before passing

    const newUser = await createUser({ fname, email, password });

    return res.status(200).json({
      data: {
        fname: newUser.fname,
        email: newUser.email,
      }
    })
  } catch (err) {
    console.error("Create user error:", err);
    res.status(500).json({ 
      message: "Internal Server Error", error: err instanceof Error ? err.message : err 
    });
  }
}