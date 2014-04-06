module RunB
  class Post

    attr_accessor :joiner_ids, :location, :pace, :time, :status
    attr_reader :committed_id, :joiner_ids, :creator_id

    def initialize(creator_id, time, location, pace)
      @creator_id = creator_id
      @time = time
      @pace = pace
      @joiner_ids = {}
      # status equals true when run is over
      @status = false
    end

  end
end
