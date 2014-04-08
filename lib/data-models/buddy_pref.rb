module RunB
  class BuddyPref

# post id attributes allows users to search through posts that fit their
# gender and age groups
    attr_accessor :age, :gender, :post_id, :id

    def initialize(age, gender)
      @age_pref = age
      @gen_pref = gender
    end

  end
end
