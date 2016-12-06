require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent

    attr_reader :position, :input

    def initialize(position, input, playerGraphic)
        super(position, input, playerGraphic)
        @input = input
        @graphity = 5
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
            deltaX = 0
            deltaY =  -@input.delta * 2
        elsif @input.direction == :none
            deltaX = 0
            deltaY = 0
        end
        # Do nothing when down is pressed
        # @position.updateDelta(0, @input.delta) if @input.direction == :down

        # This is used for the graphity
        deltaY = deltaY + @graphity unless $map.groundReached?(@position.x, @position.y + @graphicalComponent.height)
        @position.updateDelta(deltaX, deltaY)
    end

end