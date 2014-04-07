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
   id          INTEGER  PRIMARY KEY,
   name        TEXT     NOT NULL,
   password    INTEGER  NOT NULL,
   age         INTEGER  NOT NULL,
   email       TEXT     NOT NULL,
   level       INTEGER  NOT NULL,
   rating      INTEGER  NOT NULL,
   budp_id     INTEGER  NOT NULL,
 );
}
sqlite.execute %q{
 CREATE TABLE sessions(
   id          INTEGER   PRIMARY KEY,
   user_id     INTEGER   NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id),
 );
}
sqlite.execute %q{
 CREATE TABLE  circles(
   id          INTEGER   PRIMARY KEY,
   id          INTEGER   NOT NULL,
   name        TEXT      NOT NULL,
 );
}
sqlite.execute %q{
 CREATE TABLE posts(
   id          INTEGER   PRIMARY KEY,
   id          INTEGER   NOT NULL,
   creator_id  INTEGER   NOT NULL,
   time        INTEGER   NOT NULL,
   location    TEXT      NOT NULL,
   pace        INTEGER   NOT NULL,
   complete    BOOLEAN      NOT NULL,
   min_amt     INTEGER   NOT NULL,
   FOREIGN KEY(creator_id) REFERENCES users(id),
 );
}
sqlite.execute %q{
 CREATE TABLE  commitments(
   id          INTEGER   PRIMARY KEY,
   user_id     INTEGER   NOT NULL,
   fulfilled   BOOLEAN      NOT NULL,
   amount      INTEGER   NOT NULL,
   id          INTEGER   NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id)
 );
}


puts "Database Schema:\n\n"
puts `echo .schema | sqlite3 #{db_name}`

