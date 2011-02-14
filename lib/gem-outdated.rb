module Gem
  module Outdated
    # Your code goes here...
  end
end


require 'rubygems/command_manager'
require 'rubygems/commands/better_outdated_command'

Gem::CommandManager.instance.register_command :better_outdated
