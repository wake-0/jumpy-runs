require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'playerGraphic'
require_relative 'playerPhysic'

class Player < GameObject

    def initialize (position, input_x, input_y, window, map, character = 1)
        super(position, input_x, input_y, window)
        
        player_graphic = PlayerGraphic.new(position, window, character)
        player_physic = PlayerPhysic.new(position, input_x, input_y, player_graphic, map)
        add_component(player_graphic)
        add_component(player_physic)
    end
end