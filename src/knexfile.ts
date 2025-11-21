import dotenv from "dotenv";
dotenv.config();

export const database = {
  development: {
    client: "mysql2",
    connection: {
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      port: 3306,
    },
    pool: { min: 0, max: 10 },
  },
};