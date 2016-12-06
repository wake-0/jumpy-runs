require_relative 'graphicalComponent'
require_relative 'physicalComponent'

class GameObject
    
    attr_reader :position, :position

    def initialize(position, input)
        # These are the components of the game object
        # for example the graphic, the logic, the sound
        @physicalComponents = []
        @graphicalComponents = []
        @position = position
        @input = input
    end

    def draw
        @graphicalComponents.each { |c| c.draw }
    end

    def update
        @physicalComponents.each { |c| c.update }
    end

    def addComponent component
        @graphicalComponents << component if component.class <= GraphicalComponent
        @physicalComponents << component if component.class  <= PhysicalComponent
    end

    def removeComponent component
        @graphicalComponents.delete(component)
        @physicalComponents.delete(component)
    end

end