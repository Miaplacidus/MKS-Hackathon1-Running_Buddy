module RunB
  class User
    # User has properties:
    # username, password, experience, buddy pref
    # email, history, rating
    attr_accessor :name, :email, :age, :bf_id, :level, :rating
    attr_reader :wallet_id

    @@num_users = 0
    def initialize(name, password, age, email, level)
      @name = name
      @password = password
      @age = age
      @email = email
      @@num_users += 1
      @id = @@num_users
      @level = 3
      @rating = 3
    end


  end
end

# Levels are like so:
# 0 - Military (6 min/mi)
# 1 - Advanced (7-8 min/mi)
# 2 - Intermediate (9-10 min/mi)
# 3 - Beginner (11-12 min/mi)
# 4 - Speedwalk (13+ min/mi)
