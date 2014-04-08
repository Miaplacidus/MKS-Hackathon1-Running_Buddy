module RunB
  class BuddyPref

# post id attributes allows users to search through posts that fit their
# gender and age groups
    attr_reader :id
    attr_accessor :age, :gender, :post_id

    @@num_bprefs = 0
    def initialize(age, gender)
      @age_pref = age
      @gen_pref = gender
      @@num_bprefs +=1
      @id = @@num_bprefs
    end

  end
end
