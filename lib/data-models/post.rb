module RunB
  class Post

    attr_accessor :time, :location, :pace, :complete, :min_amt
    attr_reader :id, :creator_id

    @@num_posts = 0
    def initialize(creator_id, time, location, pace, min_commitment)
      @creator_id = creator_id
      @time = time
      @location = location
      @pace = pace
      # status equals true when time = Time.now
      @complete = false
      @min_amt = min_commitment
      @@num_posts +=1
      @id = @@num_posts
    end

  end
end
