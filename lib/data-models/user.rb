module RunB
  class User
    # Additionally, user has property history, a list of
    # all of their completed runs
    attr_reader :id
    attr_accessor :name, :email, :age, :level, :rating, :wallet_id

    @@num_users = 0
    def initialize(attrs={})
      @name = attrs[:name]
      @password = attrs[:password]
      @age = attrs[:age]
      @email = attrs[:email]
      @level = 3
      @rating = 3
      @@num_users += 1
      @id = @@num_users
      @wallet_id = nil
    end

  end
end

# Levels are like so:
# 0 - Military (6 min/mi)
# 1 - Advanced (7-8 min/mi)
# 2 - Intermediate (9-10 min/mi)
# 3 - Beginner (11-12 min/mi)
# 4 - Speedwalk (13+ min/mi)

# Age
# 0 - Age 16-18
# 1 - Age 19-21
# 2 - Age 22-29
# 3 - Age 30-39
# 4 - Age 40-49
# 5 - Age 50+
# 6 - no preference
