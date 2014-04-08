module RunB

  class JoinCircle < UseCase
    def run(inputs)
      @db = RPS.db
      circle = @db.get_circle(inputs[:circle_id])
      return failure(:missing_circle) if circle.nil?

      creator = @db.get_user(inputs[:creator_id])
      return failure(:missing_creator) if creator.nil?

      joiner = @db.get_user(inputs[:joiner_id])
      return failure(:missing_joiner) if joiner.nil?

      success(:circle => circle)



    end
  end
end
