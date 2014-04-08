module RunB
  class Commitment
    # NOTE USE CASES: Check that com_amount >= post min_amount
    # NOTE USE CASES: User can only modify amount up to 12 hours
    # before a run
    attr_reader :user_id
    attr_accessor :amount, :id

    def initialize(user_id, com_amount, post_id)
      @user_id = user_id
      @amount = com_amount
      @post_id = post_id
      # @fulfilled true if post is complete and user attends run
      # (checked via Google maps)
      @fulfilled = false
      @@num_commits +=1
    end

  end
end
