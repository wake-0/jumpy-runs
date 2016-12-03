require_relative 'component'
require_relative 'move'

class GameObject
    
    def initialize
        # These are the components of the game object
        # for example the graphic, the logic, the sound
        @components = []
    end

    def draw move
        @components.each {|c| c.draw(move) }
    end

    def addComponent component
        @components << component
    end

    def removeComponent component
        @components.delete(component)
    end

end