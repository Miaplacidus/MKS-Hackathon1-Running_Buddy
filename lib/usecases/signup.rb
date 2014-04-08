module RunB

  class SignUp < UseCase
    def run(inputs)
      user = RunB.db.create_user(inputs[:name], inputs[:password], inputs[:age], input[:email], input[:email], input[:level], input[:buddy_age], input[:buddy_gender])
      return failure(:username_taken) if check_name(input[:name])

      password = inputs[:password]
      return failure(:weak_password) if password.length < 5

      age = inputs[:age]
      return failure(:missing_age) if age == nil

      email = inputs[:email]
      return failure(:missing_email) if email == nil

      level = inputs[:level]
      return failure(:missing_level) if level == nil


      buddy_age = inputs[:buddy_age]
      return failure(:missing_buddy_age_preference) if buddy_age == nil


      buddy_gender = inputs[:buddy_gender]
      return failure(:missing_buddy_gender_preference) if buddy_gender == nil

      session = RunB.db.create_session(user.id)
      return success(:session_id => session.id, :user => user)

    end

  def check_name(username)
    users = RunB.db.ls_users
    users.find {|user| user.name == username}
  end

  end
end
