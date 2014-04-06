module RunB
  class User
    # User has properties:
    # username, password, experience, buddy pref
    # email, history, rating
    attr_accessor :name, :email, :age, :buddy_pref, :level

    @@num_users = 0
    def initialize(name, password, age, email, level)
      @name = name
      @password = password
      @age = age
      @email = email
      @@num_users += 1
      @id = @@num_users
      @level =
    end


  end
end
