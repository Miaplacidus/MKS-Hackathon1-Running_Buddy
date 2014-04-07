require 'sqlite3'

db_name = ARGV[0] || 'RunB.db'
sqlite = SQLite3::Database.new(db_name)

puts "Destroying #{db_name}..."
sqlite.execute %q{DROP TABLE IF EXISTS users}
sqlite.execute %q{DROP TABLE IF EXISTS sessions}
sqlite.execute %q{DROP TABLE IF EXISTS circles}
sqlite.execute %q{DROP TABLE IF EXISTS posts}
sqlite.execute %q{DROP TABLE IF EXISTS commitments}



puts "Creating tables..."
sqlite.execute %q{
 CREATE TABLE users (
   id          INTEGER PRIMARY KEY AUTOINCREMENT,
   name        TEXT     NOT NULL,
   password    INT      NOT NULL,
   age         INT      NOT NULL,
   email       TEXT     NOT NULL,
   level       INT
 );
}
sqlite.execute %q{
 CREATE TABLE friendships (
   id                                  INTEGER                         PRIMARY KEY,
   user_source_id    INT           NOT NULL,
   user_target_id                INT                        NOT NULL,
   FOREIGN KEY(user_source_id) REFERENCES users(id),
   FOREIGN KEY(user_target_id) REFERENCES users(id)
 );
}
