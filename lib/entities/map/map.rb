require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'mapGraphic'

class Map < GameObject

    def initialize (position, inputX, inputY, window)
        super(position, inputX, inputY, window)

        @mapGraphic = MapGraphic.new(position, window)
        addComponent(@mapGraphic)
    end

    def getGround(x)
        @mapGraphic.getGround(x)
    end

end