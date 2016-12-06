class Position

    attr_reader :x, :y, :direction

    def initialize(x, y, direction)
        @x = x
        @y = y
        @direction = direction
    end

    def update x, y
        updateDirection(x, y)        
        @oldX = @x
        @oldY = @y
        @x = x
        @y = y
    end

    def updateDirection x, y
        if (@x == x && @y == y) 
            return 
        end

        if @x < x
            @direction = :right
        elsif @x > x
            @direction = :left
        elsif @y < y
            @direction = :down
        elsif @y > y
            @direction = :up
        end
    end

    def updateDelta xDelta, yDelta = 0
        self.update @x + xDelta, @y + yDelta
    end

    def hasChanged
        @x != @oldX # || @y != @oldY
    end
end