# Create our module. This is so other files can start using it immediately
module RunB
end

# Require all of our project files
require_relative 'data-models/commitment.rb'
require_relative 'data-models/post.rb'
require_relative 'data-models/profile.rb'
require_relative 'data-models/user.rb'
require_relative 'use_case.rb'
Dir[File.dirname(__FILE__) + '/use_cases/*.rb'].each {|file| require file }
