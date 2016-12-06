require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent

    attr_reader :position, :input

    def initialize(position, input)
        super(position, input)
        @input = input
        @graphity = 10.0
        @isFalling = false
    end

    def update
        deltaX = 0
        deltaY = 0
        if @input.direction == :right
            deltaX = @input.delta
            deltaY = @isFalling ? 3 : 0
        elsif @input.direction == :left
            deltaX = -@input.delta
            deltaY = @isFalling ? 3 : 0
        elsif @input.direction == :top
            jump
        elsif @input.direction == :none
            deltaX = 0
            deltaY = 0
        end

        # Do nothing when down is pressed
        # @position.updateDelta(0, @input.delta) if @input.direction == :down

        @position.updateDelta(deltaX, deltaY)
    end

    private 
    def jump
        @position.updateDelta(0, -@input.delta*2)
        # Add logic for using graphity
        # @isFalling = true 
    end

end