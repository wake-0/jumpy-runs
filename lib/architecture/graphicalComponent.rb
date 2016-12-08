require_relative 'component'

class GraphicalComponent < Component
    
    def initialize(position, window)
        super(position)
        @window = window
    end

    def draw
    end

    def in_range?(x)
    end

    def get_ground(x)
    end
end