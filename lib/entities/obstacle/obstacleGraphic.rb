require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class ObstacleGraphic < GraphicalComponent 

    def initialize(position, window)
        super(position, window)
        
        @width = 32
        @height = 16
        @image = Gosu::Image.load_tiles window, './resources/sheet.png', @width, @height, false
        
        @size = 2
        @start_x = position.x
        @end_x = @start_x + @width * @size
        @start_y = position.y
        @end_y = @start_y + @height * @size
    end

    def draw
        frame = 12
        image = @image[frame]
        image.draw @start_x, @start_y, 1, @size, @size
    end

    def in_range?(x)
        x <= @end_x && x >= @start_x
    end

    def get_ground(x)
        @start_y
    end
end