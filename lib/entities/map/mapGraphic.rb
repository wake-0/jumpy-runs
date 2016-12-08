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

        @start_x = 0
        @end_x = window.width
        @start_y = window.height - (@height*@size)
        @end_y = window.height
    end

    def draw
        draw_background_color
        draw_ground
    end

    def in_range?(x)
        x >= @start_x && x <= @end_x
    end

    def get_ground(x)
        @start_y
    end

    private
    def draw_background_color
        # General background color
        @window.draw_quad(
            0,              0,               @color,
            @window.width,  0,               @color,
            0,              @window.height,  @color2,
            @window.width,  @window.height,  @color2,
            0
        )
    end

    def draw_ground
        parts = 0
        frame = 4
        image = @image[frame]
        while @window.width - parts*(@width*@size) > 0
            image.draw parts*(@width*@size), @start_y, 1, @size, @size
            parts = parts + 1
        end
    end
end