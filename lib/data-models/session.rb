module RunB

  class Session
    attr_reader :id, :user_id

    @@counter_session_id = 0

    def initialize(user_id)
      @@counter_session_id += 1
      @id = @@counter_session_id
      @user_id = user_id
    end

  end

end
