module RunB
  class Circle
    # NOTE JOIN TABLE: Lists all users belonging to a circle
    attr_reader :name
    attr_accessor :id, :creator_id, :joiner_id

  @@num_circles = 0
    def initialize(name="Friends", creator_id, joiner_id)
      @@num_circles+=1
      @id = @@num_circles
      @name = name
      @creator_id = creator_id
      @joiner_id = joiner_id
    end

  end
end
