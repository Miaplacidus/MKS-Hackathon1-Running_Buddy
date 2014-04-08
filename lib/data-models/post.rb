module RunB
  class Post

    attr_accessor :time, :location, :pace, :complete, :min_amt, :budp_id
    attr_reader :id, :creator_id

    @@num_posts = 0
    def initialize(attrs={})
      @creator_id = attrs[:creator_id]
      @time = attrs[:time]
      @location = attrs[:location]
      @pace = attrs[:pace]
      # status equals true when time = Time.now
      if attrs[:complete]
        @complete = attrs[:complete]
      else
        @complete = false
      end
      @min_amt = attrs[:min_amt]
      @@num_posts +=1
      @id = @@num_posts
      buddy_pref = BuddyPref.new(buddy_age, buddy_gender)
      @budp_id = buddy_pref.id
    end

  end
end

# PACE are like so:
# 0 - Military (6 min/mi)
# 1 - Advanced (7-8 min/mi)
# 2 - Intermediate (9-10 min/mi)
# 3 - Beginner (11-12 min/mi)
# 4 - Speedwalk (13+ min/mi)
