# For import the file name is used instead of the class name
require_relative 'lib/player'
require_relative 'lib/map'

string = 'Hello world'
# puts adds automatically line ending
puts string

# print does not add a line ending
print string + "\n"

# Create new object 
player = Player.new
# Call the methods from the object
player.jump
player.goAhead
player.goBack 

# Does not work at the moment
# and I don't understand why not
map = Map.new
puts map.getName