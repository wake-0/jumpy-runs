require_relative 'component'

class PhysicalComponent < Component

    def initialize(view, input_x, input_y, graphical_component)
        super(view)
        @input_x = input_x
        @input_y = input_y
        @graphical_component = graphical_component
    end

    def update(game_finished)
    end

end