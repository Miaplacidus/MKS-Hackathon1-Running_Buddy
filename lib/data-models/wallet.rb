module RunB
  class Wallet

    attr_reader :user_id
    attr_accessor :balance, :id

    def initialize(user_id, initial_amount)
      @balance = initial_amount
      @user_id = user_id
    end

  end
end
