module RunB
  class Post

    attr_accessor :time, :location, :pace, :complete, :min_amt, :budp_id, :id
    attr_reader :creator_id

    @@num_posts = 0
    def initialize(attrs={})
      @creator_id = attrs[:creator_id]
      @time = attrs[:time]
      @location = attrs[:location]
      @pace = attrs[:pace]
      # complete equals true when time = Time.now
      @complete = false
      @min_amt = attrs[:min_amt]
      @@num_posts +=1
      @id = @@num_posts
    end

  end
end

# PACE are like so:
# 0 - Military (6 min/mi)
# 1 - Advanced (7-8 min/mi)
# 2 - Intermediate (9-10 min/mi)
# 3 - Beginner (11-12 min/mi)
# 4 - Speedwalk (13+ min/mi)
