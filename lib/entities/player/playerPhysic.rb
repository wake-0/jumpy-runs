require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent

    attr_reader :position, :input

    def initialize(position, input, playerGraphic)
        super(position, input, playerGraphic)
        @input = input

        @graphity = 8
        @jumpHeight = 150
        @jumpSpeed = 3
        @isJumping = false
        @highestPointReached = false
    end

    def update
        deltaX = 0
        deltaY = 0
        
        if @input.direction == :right
            deltaX = @input.delta
            deltaY = 0
        elsif @input.direction == :left
            deltaX = -@input.delta
            deltaY = 0
        elsif @input.direction == :top
            @isJumping = true
            deltaX = 0
            deltaY = -@input.delta * @jumpSpeed unless @highestPointReached  
        elsif @input.direction == :none
            deltaX = 0
            deltaY = 0
        end
        # Do nothing when down is pressed
        # @position.updateDelta(0, @input.delta) if @input.direction == :down

        # Used for the graphity
        deltaY = deltaY + distanceToGround if @highestPointReached && distanceToGround <= @graphity 
        deltaY = deltaY + @graphity if @highestPointReached && distanceToGround > @graphity
        @highestPointReached = false if distanceToGround == 0
        @highestPointReached = true if distanceToGround >= @jumpHeight || !@isJumping
        @isJumping = false

        @position.updateDelta(deltaX, deltaY)
    end

    def distanceToGround
        groundY = $map.getGround(@position.x, @position.y)
        playerY = @position.y + @graphicalComponent.height
        groundY - playerY
    end

end