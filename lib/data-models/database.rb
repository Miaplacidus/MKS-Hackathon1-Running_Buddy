module RunB

  def self.db
    @__db_instance ||= Database.new
  end

  class Database
    # USER: return the history of user's runs, including run day, length, pace, etc

    def initialize
      @users = {}

      @posts = {}

      @circles = {}

      @commitments = {}

      @wallets = {}

      @buddy_prefs = {}
    end


# USER METHODS
    def create_user(username, password, age)
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
    def create_post(creator_id, time, location)
    end

    def get_post(post_id)
    end

    def ls_post
    end

    def update_post(post_id, data_hash)
    end

    def delete_post(post_id)
    end


#WALLET METHODS
    def create_wallet()
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
