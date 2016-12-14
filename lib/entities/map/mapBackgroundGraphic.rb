require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class MapBackgroundGraphic < GraphicalComponent

    def initialize(camera, window, map_settings)
        super(camera, window, map_settings.width, map_settings.height)
        @color ||= Gosu::Color.new(0xaaaaccaa)
        @color2 ||= Gosu::Color.new(0xaa123452)
    end

    def draw
        draw_background_color
    end

    def in_range?(rect)
        true
    end

    def get_ground(rect)
        rectangle.bottom_right_y
    end

    private
    def draw_background_color
        # General background color
        @window.draw_quad(
            0,                  0,           @color,
            resized_width,      0,           @color,
            0,              resized_height,  @color2,
            resized_width,  resized_height,  @color2,
            0
        )
    end

end