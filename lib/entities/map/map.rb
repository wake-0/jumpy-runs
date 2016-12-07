require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require './lib/entities/obstacle/obstacleGraphic'
require_relative 'mapGraphic'

class Map < GameObject

    def initialize (position, input, window)
        super(position, input, window)

        @mapGraphic = MapGraphic.new(position, window)
        @obstacleGraphic = ObstacleGraphic.new(position, window)
        addComponent(@obstacleGraphic)
        addComponent(@mapGraphic)
        
    end

    def getGround(x, y)
        @graphicalComponents.each do |gc|
            return gc.getGround(x) if gc.inRange?(x, y)
        end

        # @mapGraphic.getGround(x)
    end

end