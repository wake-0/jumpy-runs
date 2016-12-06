require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class MapGraphic < GraphicalComponent

    def initialize(position, window)
        super(position, window)
        @color ||= Gosu::Color.new(0xaaaaccaa)
        @color2 ||= Gosu::Color.new(0xaa123452)
        @width = 32
        @height = 16
        @image = Gosu::Image.load_tiles window, './resources/sheet.png', @width, @height, false
        @size = 2
        @lowerBorder = window.height - (@height*@size)
    end

    def draw
        # General background color
        @window.draw_quad(
            0,              0,               @color,
            @window.width,  0,               @color,
            0,              @window.height,  @color2,
            @window.width,  @window.height,  @color2,
            0
        )

        parts = 0
        frame = 4
        image = @image[frame]
        while @window.width - parts*(@width*@size) > 0
            image.draw parts*(@width*@size), @lowerBorder, 1, @size, @size
            parts = parts + 1
        end
    end

    def groundReached?(x, y)
        y >= @lowerBorder
    end

end