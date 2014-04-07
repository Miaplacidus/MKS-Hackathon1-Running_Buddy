module RunB
  class Circle
    # NOTE JOIN TABLE: Lists all users belonging to a circle
    attr_reader :name

  @@num_circles = 0
    def initialize(name)
      @@num_circles+=1
      @id = @@num_circles
      @name = name
    end

  end
end
