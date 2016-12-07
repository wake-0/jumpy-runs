require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require './lib/entities/obstacle/obstacleGraphic'
require_relative 'mapGraphic'

class Map < GameObject

    def initialize (position, inputX, inputY, window)
        super(position, inputX, inputY, window)

        @mapGraphic = MapGraphic.new(position, window)
        addComponent(@mapGraphic)
        
        @obstaclePosition = Position.new(100, 450)
        @obstacleGraphic = ObstacleGraphic.new(@obstaclePosition, window)
        addComponent(@obstacleGraphic)

        @obstaclePosition2 = Position.new(200, 350)
        @obstacleGraphic2 = ObstacleGraphic.new(@obstaclePosition2, window)
        addComponent(@obstacleGraphic2)

        @obstaclePosition3 = Position.new(300, 250)
        @obstacleGraphic3 = ObstacleGraphic.new(@obstaclePosition3, window)
        addComponent(@obstacleGraphic3)
        
        @obstaclePosition4 = Position.new(364, 250)
        @obstacleGraphic4 = ObstacleGraphic.new(@obstaclePosition4, window)
        addComponent(@obstacleGraphic4)

        @obstaclePosition5 = Position.new(428, 250)
        @obstacleGraphic5 = ObstacleGraphic.new(@obstaclePosition5, window)
        addComponent(@obstacleGraphic5)

        @obstaclePosition6 = Position.new(492, 250)
        @obstacleGraphic6 = ObstacleGraphic.new(@obstaclePosition6, window)
        addComponent(@obstacleGraphic6)

        @obstaclePosition7 = Position.new(556, 250)
        @obstacleGraphic7 = ObstacleGraphic.new(@obstaclePosition7, window)
        addComponent(@obstacleGraphic7)

    end

    def getGround(x, y)
        minIndex = 0
        for i in 1...@graphicalComponents.length
            gc = @graphicalComponents[i]
            if gc.inRange?(x)
                minValue = @graphicalComponents[minIndex].getGround(x)
                difference = gc.getGround(x) - y
                minIndex = i if difference >= 0 && difference < minValue
            end
        end
        
        @graphicalComponents[minIndex].getGround(x)
    end

end