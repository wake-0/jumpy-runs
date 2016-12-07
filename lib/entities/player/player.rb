require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'playerGraphic'
require_relative 'playerPhysic'

class Player < GameObject

    def initialize (position, inputX,inputY, window, character = 1)
        super(position, inputX,inputY, window)
        
        playerGraphic = PlayerGraphic.new(position, window, character)
        playerPhysic = PlayerPhysic.new(position, inputX,inputY, playerGraphic)  
        addComponent(playerGraphic)
        addComponent(playerPhysic)
    end
end