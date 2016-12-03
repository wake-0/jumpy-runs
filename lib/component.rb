require_relative 'gameObject'
require_relative 'move'

class Component

    def initialize(gameObject = nil)
        @gameObject = gameObject
    end

    def draw move
    end

end