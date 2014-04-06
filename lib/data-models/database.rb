module RunB

  def self.db
    @__db_instance ||= Database.new
  end

  class Database

  end
end
