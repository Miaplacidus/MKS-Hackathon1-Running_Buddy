module RunB

  class SignUp < UseCase
    def run(inputs)
      user = RunB.db.create_user(inputs[:username], inputs[:password] inputs[:age], input[:email], input[:email], input[:level], input[:buddy_age], input[:buddy_gender])
      return failure(:username_taken) if check_name(input[:username])

      password = inputs[:password]
      return failure(:weak_password) if password.length < 5

      age = inputs[:age]
      return failure(:missing_age) if age == nil

      email = inputs[:email]
      return failure(:missing_email)

    end

  end
end
