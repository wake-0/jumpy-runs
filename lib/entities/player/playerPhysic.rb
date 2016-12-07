require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent

    attr_reader :position, :input

    def initialize(position, inputX, inputY, playerGraphic)
        super(position, inputX, playerGraphic)
        @inputX = inputX
        @inputY = inputY

        @gravity = 8
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
            deltaY = -@inputY.delta * @jumpSpeed unless @highestPointReached  
        end
        # Do nothing when down is pressed
        # @position.updateDelta(0, @input.delta) if @input.direction == :down

        deltaY = deltaY + gravityDelta
        @position.updateDelta(deltaX, deltaY)
    end

    def distanceToGround
        groundY = $map.getGround(@position.x, @position.y)
        playerY = @position.y + @graphicalComponent.height
        groundY - playerY
    end

    private
    def gravityDelta
        gravityDelta = 0
        gravityDelta = distanceToGround if @highestPointReached && distanceToGround <= @gravity 
        gravityDelta = @gravity if @highestPointReached && distanceToGround > @gravity

        # This is used to check if the highest point while jumping was reached
        @highestPointReached = false if distanceToGround == 0
        @highestPointReached = true if distanceToGround >= @jumpHeight || !@isJumping
        @isJumping = false
        gravityDelta
    end

end