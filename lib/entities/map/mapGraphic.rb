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

        @xStart = 0
        @xEnd = window.width
        @yStart = window.height - (@height*@size)
        @yEnd = window.height
    end

    def draw
        drawBackgroundColor
        drawGround
    end

    def inRange?(x)
        x >= @xStart && x <= @xEnd
    end

    def getGround(x)
        @yStart
    end

    private
    def drawBackgroundColor
        # General background color
        @window.draw_quad(
            0,              0,               @color,
            @window.width,  0,               @color,
            0,              @window.height,  @color2,
            @window.width,  @window.height,  @color2,
            0
        )
    end

    def drawGround
        parts = 0
        frame = 4
        image = @image[frame]
        while @window.width - parts*(@width*@size) > 0
            image.draw parts*(@width*@size), @yStart, 1, @size, @size
            parts = parts + 1
        end
    end
end