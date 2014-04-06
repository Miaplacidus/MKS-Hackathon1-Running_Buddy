module RunB
  class Commitment
    # commitment should have
    # id, user_id, money, status (commitment fulfilled/
    # not fulfilled), post_id
    def initialize(user_id, com_amount, post_id)
      @user_id = user_id
      @amount = com_amount
      @post_id = post_id
      # status is true if post status is true and
      # user attends post event (google maps) indicates
      # that user was at location at that time
      @status = false
    end

  end
end
