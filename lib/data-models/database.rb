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
end
