require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class ObstacleGraphic < GraphicalComponent 
    
    attr_reader :xStart, :xEnd, :yStart, :yEnd
    
    def initialize(position, window)
        super(position, window)
        
        @width = 32
        @height = 16
        @image = Gosu::Image.load_tiles window, './resources/sheet.png', @width, @height, false
        
        @size = 2
        @xStart = position.x
        @xEnd = @xStart + @width * @size
        @yStart = position.y
        @yEnd = @yStart + @height * @size
    end

    def draw
        frame = 12
        image = @image[frame]
        image.draw @xStart, @yStart, 1, @size, @size
    end

    def inRange?(x)
        x <= @xEnd && x >= @xStart
    end

    def getGround(x)
        @yStart
    end
end