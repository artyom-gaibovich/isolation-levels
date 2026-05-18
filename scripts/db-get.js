#!/usr/bin/env node
// Читает транскрипцию из БД и печатает JSON в stdout
// Использование: node scripts/db-get.js <id>

require('dotenv').config();
const { Client } = require('pg');

async function main() {
  const id = process.argv[2];
  if (!id) {
    console.error('Укажи ID: node scripts/db-get.js <id>');
    process.exit(1);
  }

  const db = new Client({ connectionString: process.env.DATABASE_URL });
  await db.connect();

  const { rows } = await db.query(
    `SELECT "fileName", code, "transcriptionText" FROM public."Transcribation" WHERE id = $1`,
    [id]
  );

  await db.end();

  if (!rows.length) {
    console.error(`Транскрипция с ID ${id} не найдена`);
    process.exit(1);
  }

  // Печатаем в stdout — Claude Code прочитает это
  console.log(JSON.stringify(rows[0]));
}

main().catch(err => {
  console.error('Ошибка:', err.message);
  process.exit(1);
});