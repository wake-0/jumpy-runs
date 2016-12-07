require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent

    attr_reader :position, :input

    def initialize(position, inputX, inputY, playerGraphic)
        super(position, inputX, playerGraphic)
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
        
        if @inputX.direction == :right
            deltaX = @inputX.delta
        elsif @inputX.direction == :left
            deltaX = -@inputX.delta
        elsif @inputX.direction == :none
            deltaX = 0
        end
        if @inputY.direction == :top
            @isJumping = true
            deltaY = -@input.delta * @jumpSpeed unless @highestPointReached  
        else 
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
        groundY = $map.getGround(@position.x)
        playerY = @position.y + @graphicalComponent.height
        groundY - playerY
    end

end