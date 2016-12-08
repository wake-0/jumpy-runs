require_relative 'component'

class PhysicalComponent < Component

    def initialize(position, input_x, input_y, graphical_component)
        super(position)
        @input_x = input_x
        @input_y = input_y
        @graphical_component = graphical_component
    end

    def update
    end

end