module RunB

  class CreateCircle < UseCase
    def run(inputs)
      circle = RunB.db.create_circle(inputs[:name], inputs[:creator_id], inputs[:joiner_id])
      return failure(:circle_taken) if check_circle(inputs[:name])
      return failure(:wrong_creator_id) if inputs[:creator_id] == nil
      return failure(:wrong_joiner_id) if inputs[:joiner_id] == nil


      success(:circle => circle)


    end

    def check_circle(name)
      circles = RunB.db.ls_circle
      circles.find{|circle| circle.name == name}
    end

  end
end
