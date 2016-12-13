require_relative 'component'
require_relative 'rectangle'

class GraphicalComponent < Component

    attr_reader  :width, :height, :unsized_width, :unsized_height, :size_factor, :rectangle

    def initialize(position, window, width, height, size_factor = 1)
        super(position)
        @window = window
        @width = width * size_factor
        @height = height * size_factor
        @unsized_width = width
        @unsized_height = height
        @size_factor = size_factor
        @rectangle = Rectangle.new(position, @width, @height)
    end

    def draw
    end

    def in_range?(rect)
    end

    def get_ground(rect)
    end
end