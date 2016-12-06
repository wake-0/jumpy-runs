require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'mapGraphic'

class Map < GameObject

    def initialize (position, input)
        super(position, input)
        addComponent(MapGraphic.new(position))
    end

end