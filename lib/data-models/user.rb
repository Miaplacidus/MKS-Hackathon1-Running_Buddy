module RunB
  class User
    # Additionally, user has property history, a list of
    # all of their completed runs
    attr_reader :wallet_id, :id
    attr_accessor :name, :email, :age, :budp_id, :level, :rating

    @@num_users = 0
    def initialize(name, password, age, email, level, buddy_age, buddy_gender)
      @name = name
      @password = password
      @age = age
      @email = email
      @level = 3
      @rating = 3
      @@num_users += 1
      @id = @@num_users
      buddy_pref = BuddyPref.new(buddy_age, buddy_gender)
      @budp_id = buddy_pref.id
    end

  end
end

# Levels are like so:
# 0 - Military (6 min/mi)
# 1 - Advanced (7-8 min/mi)
# 2 - Intermediate (9-10 min/mi)
# 3 - Beginner (11-12 min/mi)
# 4 - Speedwalk (13+ min/mi)
