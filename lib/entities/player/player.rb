require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'playerGraphic'
require_relative 'playerPhysic'

class Player < GameObject

    def initialize (position, input, character = 2)
        super(position, input)
        addComponent(PlayerGraphic.new(position, character))
        addComponent(PlayerPhysic.new(position, input))
    end
end