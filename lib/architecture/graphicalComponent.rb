require_relative 'component'
require_relative 'rectangle'

class GraphicalComponent < Component

    attr_reader  :width, :height, :rectangle

    def initialize(view, window, width, height)
        super(view)
        @window = window
        @width = width
        @height = height
        @rectangle = Rectangle.new(view, resized_width, resized_height)
    end

    def resized_width
        width * view.zoom_factor
    end

    def resized_height
        height * view.zoom_factor
    end

    def draw(game_finished)
    end

    def in_range?(rect)
    end

    def get_ground(rect)
    end
end