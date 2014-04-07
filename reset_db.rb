require 'sqlite3'

db_name = ARGV[0] || 'RunB.db'
sqlite = SQLite3::Database.new(db_name)

puts "Destroying #{db_name}..."
sqlite.execute %q{DROP TABLE IF EXISTS users}
sqlite.execute %q{DROP TABLE IF EXISTS sessions}
sqlite.execute %q{DROP TABLE IF EXISTS circles}
sqlite.execute %q{DROP TABLE IF EXISTS posts}
sqlite.execute %q{DROP TABLE IF EXISTS commitments}
# ADD BUDDY PREFERENCES, WALLET



puts "Creating tables..."
sqlite.execute %q{
 CREATE TABLE users (
   id          INTEGER  PRIMARY KEY AUTOINCREMENT,
   name        TEXT     NOT NULL,
   password    INTEGER  NOT NULL,
   age         INTEGER  NOT NULL,
   email       TEXT     NOT NULL,
   level       INTEGER  NOT NULL,
   rating      INTEGER  NOT NULL,
   budp_id     INTEGER  NOT NULL,
   wallet_id   INTEGER
 );
}
sqlite.execute %q{
 CREATE TABLE sessions(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   user_id     INTEGER   NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id),
 );
}
sqlite.execute %q{
 CREATE TABLE  circles(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   name        TEXT      NOT NULL,
 );
}
sqlite.execute %q{
 CREATE TABLE posts(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   creator_id  INTEGER   NOT NULL,
   time        INTEGER   NOT NULL,
   location    TEXT      NOT NULL,
   pace        INTEGER   NOT NULL,
   min_amt     INTEGER   NOT NULL,
   complete    BOOLEAN      NOT NULL,
   FOREIGN KEY(creator_id) REFERENCES users(id),
 );
}
sqlite.execute %q{
 CREATE TABLE  commitments(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   user_id     INTEGER   NOT NULL,
   amount      INTEGER   NOT NULL,
   post_id          INTEGER   NOT NULL,
   fulfilled   BOOLEAN      NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id)
   FOREIGN KEY(post_id) REFERENCES posts(id)
 );
}


puts "Database Schema:\n\n"
puts `echo .schema | sqlite3 #{db_name}`

