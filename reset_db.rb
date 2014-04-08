require 'sqlite3'

db_name = ARGV[0] || 'RunB_test.db'
sqlite = SQLite3::Database.new(db_name)

puts "Destroying #{db_name}..."
sqlite.execute %q{DROP TABLE IF EXISTS users}
sqlite.execute %q{DROP TABLE IF EXISTS sessions}
sqlite.execute %q{DROP TABLE IF EXISTS circles}
sqlite.execute %q{DROP TABLE IF EXISTS posts}
sqlite.execute %q{DROP TABLE IF EXISTS commitments}
sqlite.execute %q{DROP TABLE IF EXISTS group_memb}
# ADD BUDDY PREFERENCES AND BUDDY PREF ID TO POST (REMOVE FROM USER), WALLET
# GROUP MEMBERSHIP TABLE FOR CIRCLES



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
   wallet_id   INTEGER
 );
}
sqlite.execute %q{
 CREATE TABLE sessions(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   user_id     INTEGER   NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id)
 );
}
sqlite.execute %q{
 CREATE TABLE  circles(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   name        TEXT      NOT NULL,
   creator_id  INTEGER   NOT NULL,
   joiner_id   INTEGER   NOT NULL,
   FOREIGN KEY(joiner_id) REFERENCES users(id),
   FOREIGN KEY(creator_id) REFERENCES users(id)
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
   budp_id     INTEGER
   FOREIGN KEY(creator_id) REFERENCES users(id),
   FOREIGN KEY(budp_id) REFERENCES buddyprefs(id)
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
sqlite.execute %q{
 CREATE TABLE group_memb(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   user_id     INTEGER   NOT NULL,
   group_id    INTEGER   NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id),
   FOREIGN KEY(group_id)REFERENCES circle(id)
   );
}
sqlite.execute %q{
 CREATE TABLE wallets(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   user_id  INTEGER   NOT NULL,
   balance        INTEGER   NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id)
 );
}
sqlite.execute %q{
 CREATE TABLE buddyprefs(
   id          INTEGER   PRIMARY KEY AUTOINCREMENT,
   age         INTEGER   NOT NULL,
   gender      INTEGER   NOT NULL,
   post_id     INTEGER   NOT NULL,
   FOREIGN KEY(post_id) REFERENCES posts(id)
 );
}


puts "Database Schema:\n\n"
puts `echo .schema | sqlite3 #{db_name}`

