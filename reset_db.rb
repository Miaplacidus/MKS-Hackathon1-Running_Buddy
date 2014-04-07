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
   password    INT      NOT NULL,
   age         INT      NOT NULL,
   email       TEXT     NOT NULL,
   level       INT      NOT NULL,
   rating      INT      NOT NULL,
   budp_id     INT      NOT NULL,
 );
}
sqlite.execute %q{
 CREATE TABLE sessions(
   id          INTEGER   PRIMARY KEY,
   user_id     INT       NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id),
 );
}
sqlite.execute %q{
 CREATE TABLE  circles(
   id          INTEGER   PRIMARY KEY,
   id          INT       NOT NULL,
   name        TEXT      NOT NULL,
 );
}
sqlite.execute %q{
 CREATE TABLE posts(
   id          INTEGER   PRIMARY KEY,
   id          INT       NOT NULL,
   creator_id  INT       NOT NULL,
   time        INT       NOT NULL,
   location    TEXT      NOT NULL,
   pace        INT       NOT NULL,
   complete    TEXT      NOT NULL,
   min_amt     INT       NOT NULL,
   FOREIGN KEY(creator_id) REFERENCES users(id),
 );
}
sqlite.execute %q{
 CREATE TABLE  commitments(
   id          INTEGER   PRIMARY KEY,
   user_id     INT       NOT NULL,
   fulfilled   TEXT      NOT NULL,
   amount      INT       NOT NULL,
   id          INT       NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id)
 );
}


puts "Database Schema:\n\n"
puts `echo .schema | sqlite3 #{db_name}`

