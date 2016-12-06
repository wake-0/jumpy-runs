require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'mapGraphic'

class Map < GameObject

    def initialize (position, input, window)
        super(position, input, window)

        @mapGraphic = MapGraphic.new(position, window)
        addComponent(@mapGraphic)
    end

    def groundReached?(x, y)
        @mapGraphic.groundReached?(x, y)
    end

end