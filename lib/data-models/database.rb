require 'singleton'

module RunB

  def self.db
    @__db_instance ||= Database.new(@app_db_name)
  end

  def self.db_name=(db_name)
    @app_db_name = db_name
  end

  class Database
    # USER: return the history of user's runs, including run day, length, pace, etc

    def initialize(db_name)

      @sqlite = SQLite3::Database.new(db_name)

      @all_users = {}
      @all_posts = {}
      @all_circles = {}
      @all_commits = {}
      @all_wallets = {}
      @all_bprefs = {}
    end

# USER METHODS
    def create_user(username, password, age)
        new_user = User.new()
    end

    def get_user(user_id)
    end

    def get_usr_hist(user_id)
    end

    def update_user(user_id, data_hash)
    end

    def delete_user(user_id)
    end

#POST METHODS
    def create_post(creator_id, time, location, pace, min_commitment)
        new_post = RunB::Post.new()
    end

    def get_post(post_id)
    end

    def ls_post
        result = @sqlite.execute("SELECT * FROM posts")

        result.map do |row|
            post = RunB::Post.new(row[1], row[2], row[3], row[4], row[5])
            post.id = row[0]
            proj
        end
    end

    def update_post(post_id, data_hash)
    end

    def delete_post(post_id)
    end

#WALLET METHODS

    def create_wallet(user_id, amount)
    end

    def get_wallet(wallet_id)
    end

    def get_wallet_by_user(user_id)
    end

    def update_wallet(wallet_id, data_hash)
    end


#CIRCLE
    def create_circle(name)
    end

    def get_circle(circle_id)
    end

    def ls_circle
    end

    def update_circle(circle_id, data_hash)
    end

    def delete_circle(circle_id)
    end


#COMMITMENT
    def create_commitment(user_id, amount, post_id)
    end

    def get_commitment(comm_id)
    end

    def get_comm_by_usr(user_id)
    end

    def update_comm(comm_id, data_hash)
    end


#BUDDY PREFERENCES
    def create_buddy_pref(user_id, age, gender)
    end

    def get_buddy_pref(bf_id)
    end

    def update_buddy_pref(bf_id, data_hash)
    end

#QUERY METHODS
  end
end
