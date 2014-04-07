module RunB

  class SignIn < UseCase
    def run(inputs)
      user = RunB.db.get_user_from_username(inputs[:username])
      return failure(:username_missing) if user == nil
      password = inputs[:pw]
      return failure(:incorrect_password) if user.password != password

      session = RunB.db.create_session(user.id)
      return success(:session_id => session.id, :user => user)
    end
  end

end
