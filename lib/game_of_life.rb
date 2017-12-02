require 'game_of_life/version'
require 'game_of_life/earth'
require 'game_of_life/cell'
require 'game_of_life/exceptions'

def reload
  load 'game_of_life/earth.rb'
  load 'game_of_life/cell.rb'
  load 'game_of_life/exceptions.rb'
end
