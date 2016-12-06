class Input

    attr_accessor :direction, :delta 

    def initialize (direction, delta)
        @direction = direction
        @delta = delta
    end 

    def update(direction, delta)
        @direction = direction
        @delta = delta
    end

end