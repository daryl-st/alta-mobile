import jwt from "jsonwebtoken";

export const generateToken = (user: {userId: number, role: String}) => {
    // Access token - short lived
    const accessToken = jwt.sign(
        { sub: user.userId, role: user.role, type: 'access'},
        process.env.JWT_ACCESS_SECRET!,
        { expiresIn: '15m'}
    );

    const refreshToken = jwt.sign(
        { sub: user.userId, type: 'refresh'},
        process.env.JWT_REFRESH_SECRET!,
        { expiresIn: '7d'}
    );

    return { accessToken, refreshToken };
};

export const generateDeviceId = () => {
    return crypto.randomUUID();
};

export const verifyAccessToken = (token: any) => {
    try {
        const decoded = jwt.verify(token, process.env.JWT_ACCESS_SECRET!) as { sub: string, type: string};
        if (decoded.type != 'access') return null;
        return decoded;
    } catch (err) {
        return null;
    }
};

export const verifyRefreshToken = (token: any) => {
    try {
        const decoded = jwt.verify(token, process.env.JWT_REFRESH_SECRET!) as { sub: string, type: string };
        if (decoded.type != 'refresh') return null;
        return decoded;
    } catch (err) {
        return null;
    }
}