import fs from "fs";
import path from "path";
import { connection } from "./database";

async function runMigration() {
  const sqlPath = path.join(process.cwd(), "../init.sql");
  const sql = fs.readFileSync(sqlPath, "utf-8");

  try {
    await connection.query(sql);
    console.log("✅ Database and tables created successfully.");
    process.exit(0);
  } catch (error) {
    console.error("❌ Migration failed:", error);
    process.exit(1);
  }
}

runMigration();