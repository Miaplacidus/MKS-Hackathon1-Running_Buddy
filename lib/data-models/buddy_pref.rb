module RunB
  class BuddyPref

    attr_reader :id
    attr_accessor :age, :gender

    @@num_bprefs = 0
    def initialize(age, gender)
      @age_pref = age
      @gen_pref = gender
      @@num_bprefs +=1
      @id = @@num_bprefs
    end

  end
end
