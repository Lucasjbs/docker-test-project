"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = __importDefault(require("fs"));
const path_1 = __importDefault(require("path"));
const database_1 = require("./src/database");
async function runMigration() {
    const sqlPath = path_1.default.join(process.cwd(), "./init.sql");
    const sql = fs_1.default.readFileSync(sqlPath, "utf-8");
    try {
        await database_1.connection.query(sql);
        console.log("✅ Database and tables created successfully.");
        process.exit(0);
    }
    catch (error) {
        console.error("❌ Migration failed:", error);
        process.exit(1);
    }
}
runMigration();
