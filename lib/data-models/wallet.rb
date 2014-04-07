module RunB
  class Wallet

    attr_reader :id, :user_id
    attr_accessor :balance

    @@num_wallets = 0
    def initialize(user_id, initial_amount)
      @balance = initial_amount
      @user_id = user_id
      @@num_wallets +=1
      @id = @@num_wallets
    end

  end
end
