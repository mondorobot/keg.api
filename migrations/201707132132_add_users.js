module.exports.up = async (db) => {
  await db.schema.createTable('users', (table) => {
    table.increments('id');
    table.string('email', 100);
    table.string('display_name', 100);
    table.string('image_url', 200);
    table.string('rfid', 100);
    table.integer('enabled').unsigned().notNullable().defaultTo(1);
    table.timestamps(false, true);
  });
};

module.exports.down = async (db) => {
  await db.schema.dropTableIfExists('users');
};

module.exports.configuration = { transaction: true };
