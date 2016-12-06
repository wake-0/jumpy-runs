require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'playerGraphic'
require_relative 'playerPhysic'

class Player < GameObject

    def initialize (position, input, window, character = 1)
        super(position, input, window)
        
        playerGraphic = PlayerGraphic.new(position, window, character)
        playerPhysic = PlayerPhysic.new(position, input, playerGraphic)  
        addComponent(playerGraphic)
        addComponent(playerPhysic)
    end
end