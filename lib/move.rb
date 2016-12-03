class Move

    def initialize x, y
        @newX = x
        @newY = y
        @direction = :right
    end

    def xPos
        @newX
    end

    def yPos
        @newY
    end

    def direction
        @direction
    end

    def update x, y
        updateDirection(x, y)        
        @oldX = @newX
        @oldY = @newY
        @newX = x
        @newY = y
    end

    def updateDirection x, y
        if (@newX == x && @newY == y) 
            return 
        end

        if @newX < x
            @direction = :right
        elsif @newX > x
            @direction = :left
        end
    end

    def updateDelta xDelta, yDelta = 0
        self.update @newX + xDelta, @newY + yDelta
    end

    def hasChanged
        @newX != @oldX || @newY != @oldY
    end
end