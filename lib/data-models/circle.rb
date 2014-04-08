module RunB
  class Circle
    # NOTE JOIN TABLE: Lists all users belonging to a circle
    attr_reader :name
    attr_accessor :id, :creator_id, :joiner_id

    def initialize(name="Friends", creator_id)
      @name = name
      @creator_id = creator_id
    end

  end
end
