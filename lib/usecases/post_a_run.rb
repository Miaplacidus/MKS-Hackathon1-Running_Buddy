module RunB

  class PostARun < UseCase
    def run(inputs)
      post = RunB.db.create_post(inputs[:creator_id], inputs[:time], inputs[:location], inputs[:pace], inputs[:min_commit])
      return failure(:missing_creator_id) if inputs[:creator_id] == nil
      return failure(:missing_time) if inputs[:time] == nil
      return failure(:missing_location) if inputs[:location] == nil
      return failure(:missing_pace) if inputs[:pace] == nil
      return failure(:missing_min_commit) if inputs[:min_commit] == nil

      return success(:post => post)
    end



  end

end
