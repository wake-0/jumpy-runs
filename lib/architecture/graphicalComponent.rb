require_relative 'component'
require_relative 'rectangle'

class GraphicalComponent < Component

    attr_reader  :width, :height, :rectangle

    def initialize(camera, window, width, height)
        super(camera)
        @window = window
        @width = width
        @height = height
        @rectangle = Rectangle.new(camera, resized_width, resized_height)
    end

    def resized_width
        width * camera.zoom_factor
    end

    def resized_height
        height * camera.zoom_factor
    end

    def draw
    end

    def in_range?(rect)
    end

    def get_ground(rect)
    end
end