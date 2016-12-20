require_relative 'graphicalComponent'
require_relative 'physicalComponent'

class GameObject

    attr_reader :view, :window

    def initialize(view, input_x, input_y, window)
        # These are the components of the game object
        # for example the graphic, the logic, the sound
        @physical_components = []
        @graphical_components = []
        @view = view
        @input_x = input_x
        @input_y = input_y
        @window = window
    end

    def draw
        @graphical_components.each { |c| c.draw }
    end

    def update
        @physical_components.each { |c| c.update }
    end

    def add_component(component)
        @graphical_components << component if component.class <= GraphicalComponent
        @physical_components << component if component.class <= PhysicalComponent
    end

    def remove_component(component)
        @graphical_components.delete(component)
        @physical_components.delete(component)
    end

end