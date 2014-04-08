# Require our project (i.e. client_helper), which in turns requires everything else
require './lib/client_helper.rb'
require 'pry-debugger'

RSpec.configure do |config|
  # Configure each test to always use a new singleton instance
  config.before(:each) do
    RunB.instance_variable_set(:@__db_instance, nil)

    # RunB.db.clear_all_records
  end
end
