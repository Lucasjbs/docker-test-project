import knex from "knex";
import { database } from "./knexfile";

export const connection = knex(database.development);