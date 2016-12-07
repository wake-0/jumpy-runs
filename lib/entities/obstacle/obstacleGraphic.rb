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
        @xStart = 100
        @xEnd = @xStart + @width * @size
        @yStart = 480
        @yEnd = @yStart + @height * @size
    end

    def draw
        frame = 12
        image = @image[frame]
        image.draw @xStart, 480, 1, @size, @size
    end

    def inRange?(x, y)
        x <= @xEnd && x >= @xStart && y <= @yEnd && y >= @yStart
    end

    def getGround(x)
        @yStart
    end
end