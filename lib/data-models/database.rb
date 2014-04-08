require 'singleton'

module RunB

  def self.db
    @__db_instance ||= DB.new(@app_db_name)
  end

  def self.db_name=(db_name)
    @app_db_name = db_name
  end


  class DB
  # attr_accessor :users, :posts, :circles, :commitments, :wallets, :buddy_prefs, :sessions
    # USER: return the history of user's runs, including run day, length, pace, etc

    def initialize(db_name)
       raise StandardError.new("Please set RunB.db_name") if db_name.nil?

      @sqlite = SQLite3::Database.new(db_name)

      # @all_users = {}
      # @all_posts = {}
      # @all_circles = {}
      # @all_commits = {}
      # @all_wallets = {}
      # @all_bprefs = {}
      # @sessions = {}
    end

# USER METHODS
    # def create_user(username, password, age, email, level, buddy_age, buddy_gender)
    #   new_user = RunB::User.new(username, password, age, email, level, buddy_age, buddy_gender)
    #   bpref = self.create_buddy_pref(buddy_age, buddy_gender)
    #   @sqlite.execute("INSERT INTO users (name, password, age, email, level, bpref_id) VALUES (?);", name, password, age, email, level, bpref.id)
    #   new_user.id = @sqlite.execute("SELECT last_insert_rowid()")[0][0]
    #   new_user
    # end

    # def get_user(user_id)
    #   rows = @sqlite.execute("SELECT * FROM users WHERE id = ?", user_id)
    #   data = rows.first
    #   # Create a convenient Project object based on the data given to us by SQLite
    #   user = RunB::User.new(data[1], data[2], data[3], data[4], data[5])
    #   user.id = data[0]
    #   user
    # end

    # def ls_users
    #   user_list = @sqlite.execute("SELECT * FROM users")

    #   user_list.map do |row|
    #     user = RunB::Post.new(row[1], row[2], row[3], row[4], row[5])
    #     user.id = row[0]
    #     user
    #   end
    # end


    # def get_user_from_username(username)
    #     rows = @sqlite.execute("SELECT * users where name = ?", username)
    #     data = rows.first
    #     user = RunB::User.new(data[1], data[2], data[3], data[4], data[5])
    #     user.id = data[0]
    #     user
    # end

    # def get_usr_hist(user_id)
    #     run_list = @sqlite.execute("SELECT * commitments where user_id = ?", user_id)

    #     run_list.map do |row|
    #         post = self.get_post(row[4])
    #         post
    #     end
    # end

    # def update_user(user_id, data_hash)
    #     # (username, password, age, email, level, buddy_age, buddy_gender)
    #     if data_hash[:username]
    #       @sqlite.execute("UPDATE users SET name = ? WHERE id = ?", data_hash[:username], user_id)
    #     end
    #     if data_hash[:age]
    #       @sqlite.execute("UPDATE users SET age = ? WHERE id = ?", data_hash[:age], user_id)
    #     end
    #     if data_hash[:email]
    #       @sqlite.execute("UPDATE users SET email = ? WHERE id = ?", data_hash[:email], user_id)
    #     end
    #     if data_hash[:level]
    #       @sqlite.execute("UPDATE users SET level = ? WHERE id = ?", data_hash[:level], user_id)
    #     end
    # end

    # def delete_user(user_id)
    # end



# #POST METHODS
#     def create_post(creator_id, time, location, pace, min_commit)
#       new_post = RunB::Post.new(creator_id, time, location, pace, min_commit)
#       @sqlite.execute("INSERT INTO posts (creator_id, time, location, pace, min_commit) VALUES (?);", creator_id, time, location, pace, min_commit)
#       new_post.id = @sqlite.execute("SELECT last_insert_rowid()")[0][0]
#       new_post
#     end

#     def get_post(post_id)
#       rows = @sqlite.execute("SELECT * FROM posts WHERE id = ?", post_id)
#       data = rows.first
#       # Create a convenient Project object based on the data given to us by SQLite
#       post = RunB::Post.new(data[1], data[2], data[3], data[4], data[5])
#       post.id = data[0]
#       post
#     end

#     def ls_post
#         post_list = @sqlite.execute("SELECT * FROM posts")

#         post_list.map do |row|
#             post = RunB::Post.new(row[1], row[2], row[3], row[4], row[5])
#             post.id = row[0]
#             post
#         end
#     end

#     def update_post(post_id, data_hash)
#         if data_hash[:time]
#           @sqlite.execute("UPDATE posts SET time = ? WHERE id = ?", data_hash[:time], post_id)
#         end
#         if data_hash[:location]
#           @sqlite.execute("UPDATE posts SET location = ? WHERE id = ?", data_hash[:location], post_id)
#         end
#         if data_hash[:pace]
#           @sqlite.execute("UPDATE posts SET pace = ? WHERE id = ?", data_hash[:pace], post_id)
#         end
#         if data_hash[:min_amt]
#           @sqlite.execute("UPDATE posts SET min_amt = ? WHERE id = ?", data_hash[:min_amt], post_id)
#         end
#         if data_hash[:buddy_age]
#           @sqlite.execute("UPDATE posts SET buddy_age = ? WHERE id = ?", data_hash[:buddy_age], post_id)
#         end
#         if data_hash[:buddy_gender]
#           @sqlite.execute("UPDATE posts SET buddy_gender = ? WHERE id = ?", data_hash[:buddy_gender], post_id)
#         end
#     end

#     def delete_post(post_id)
#     end


# #WALLET METHODS

#     def create_wallet(user_id, init_amt)
#         new_wallet = RunB::Wallet.new(user_id, init_amt)
#         @sqlite.execute("INSERT INTO wallets (user_id, balance) VALUES (?);", user_id, init_amt)
#         new_wallet.id = @sqlite.execute("SELECT last_insert_rowid()")[0][0]
#         new_wallet
#     end

#     def get_wallet(wallet_id)
#       rows = @sqlite.execute("SELECT * FROM wallets WHERE id = ?", wallet_id)
#       data = rows.first
#       # Create a convenient Project object based on the data given to us by SQLite
#       wallet = RunB::Wallet.new(data[1], data[2])
#       wallet.id = data[0]
#       wallet
#     end

#     def get_wallet_by_user(user_id)
#       rows = @sqlite.execute("SELECT * FROM wallets WHERE user_id = ?", user_id)
#       data = rows.first
#       # Create a convenient Project object based on the data given to us by SQLite
#       wallet = RunB::Wallet.new(data[1], data[2]])
#       wallet.id = data[0]
#       wallet
#     end

#     def update_wallet(user_id, transaction)
#       wallet = self.get_wallet_by_user(user_id)
#       @sqlite.execute("UPDATE wallets SET balance = ? WHERE id = ?", wallet.balance + transaction, wallet.id)
#     end


# #CIRCLE
#     def create_circle(name)
#         new_circle = RunB::Circle.new(name)
#         @sqlite.execute("INSERT INTO circles (name) VALUES (?);", name)
#         new_circle.id = @sqlite.execute("SELECT last_insert_rowid()")[0][0]
#         new_circle
#     end

#     def get_circle(circle_id)
#       rows = @sqlite.execute("SELECT * FROM circles WHERE id = ?", circle_id)
#       data = rows.first
#       # Create a convenient Project object based on the data given to us by SQLite
#       circle = RunB::Circle.new(data[1])
#       circle.id = data[0]
#       circle
#     end

#     def ls_circle
#         circle_list = @sqlite.execute("SELECT * FROM circles")

#         circle_list.map do |row|
#             circle = RunB::Circle.new(row[1])
#             circle.id = row[0]
#             circle
#         end
#     end

#     def update_circle(circle_id, name)
#       @sqlite.execute("UPDATE circles SET name = ? where id = ?", name, circle_id)
#     end

#     def delete_circle(circle_id)
#     end

#  # CIRCLE MEMBERSHIPS

#     def add_circle_member(circle_id, user_id)
#       @sqlite.execute("INSERT INTO circle_membership (user_id) VALUES (?)", user_id)
#     end

#     def get_circle_members_by_cid(circle_id)
#       member_list = @sqlite.execute("SELECT * FROM circle_membership WHERE circle_id = ?", circle_id)

#       member_list.map do |row|
#             user = self.get_user(row[1])
#             user
#         end
#     end

#     def get_circles_by_uid(user_id)
#       circle_list = @sqlite.execute("SELECT * FROM circle_membership WHERE user_id = ?", user_id)

#       circle_list.map do |row|
#             circle = self.get_circle(row[2])
#             circle
#         end
#     end


# #COMMITMENT
#     def create_commitment(user_id, amount, post_id)
#         new_commit = RunB::Commitment.new(user_id, amount, post_id)
#         @sqlite.execute("INSERT INTO commitments (user_id, amount, post_id) VALUES (?);", user_id, amount, post_id)
#         new_commit.id = @sqlite.execute("SELECT last_insert_rowid()")[0][0]
#         new_commit
#     end

#     def get_commitment(comm_id)
#       rows = @sqlite.execute("SELECT * FROM commitments WHERE id = ?", comm_id)
#       data = rows.first
#       # Create a convenient Project object based on the data given to us by SQLite
#       commit = RunB::Commitment.new(data[1], data[2], data[3])
#       commit.id = data[0]
#       commit
#     end

#     def ls_usr_commitment(user_id)
#       commit_list = @sqlite.execute("SELECT * FROM commitments WHERE user_id = ?", user_id)

#       commit_list.map do |row|
#         commit = RunB::Post.new(row[1], row[2], row[3])
#         commit.id = row[0]
#         commit
#       end
#     end

#     def update_comm(comm_id, com_amt)

#     end


# #BUDDY PREFERENCES
#     def create_buddy_pref(age, gender)
#         new_bpref = RunB::BuddyPref.new(age, gender)
#         @sqlite.execute("INSERT INTO buddyprefs (user_id, age, gender) VALUES (?);", age, gender)
#         new_bpref.id = @sqlite.execute("SELECT last_insert_rowid()")[0][0]
#         new_bpref
#     end

#     def get_buddy_pref(bf_id)
#       rows = @sqlite.execute("SELECT * FROM buddyprefs WHERE id = ?", bf_id)
#       data = rows.first
#       # Create a convenient Project object based on the data given to us by SQLite
#       bpref = RunB::BuddyPref.new(data[1], data[2])
#       bpref.id = data[0]
#       bpref
#     end

#     def update_buddy_pref(bf_id, data_hash)

#     end

# #QUERY METHODS
#     def create_session(user_id)
#         new_session = RunB::Session.new(user_id)
#         @sqlite.execute("INSERT INTO sessions (user_id) VALUES (?);", user_id)
#         new_session.id = @sqlite.execute("SELECT last_insert_rowid()")[0][0]
#         new_session
#     end

#   end
# end


end
end
