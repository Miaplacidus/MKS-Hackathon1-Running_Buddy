module RunB

  class MakeACommitment < UseCase
    def run(inputs)
      commitment = RunB.db.create_commitment(inputs[:user_id], inputs[:amount], inputs[:post_id])
      return failure(:wrong_user_id) if inputs[:user_id] == nil
      return failure(:amount_not_acceptable) if inputs[:amount] > 15
      return failure(:wrong_post_id) if inputs[:post_id] == nil

      return success(:commitment => commitment)
    end

  end

end
