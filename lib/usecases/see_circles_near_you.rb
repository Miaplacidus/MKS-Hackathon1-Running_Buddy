module RunB

  class SeeCirclesNearYou < UseCase
    def run(inputs)
      @db = RPS.db
      circle = @db.get_circle(inputs[:circle_id])
      return failure(:missing_circle) if circle.nil?


    end
  end
end
