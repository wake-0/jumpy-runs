require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent

    attr_reader :position, :input

    def initialize(position, input)
        super(position, input)
        @input = input
        @graphity = 10.0
    end

    def update
        @position.updateDelta(@input.delta, 0) if @input.direction == :right
        @position.updateDelta(-@input.delta, 0) if @input.direction == :left
        @position.updateDelta(0, @input.delta) if @input.direction == :down
        @position.updateDelta(0, -@input.delta) if @input.direction == :top
        @position.updateDelta(0,0) if @input.direction == :none
    end

end