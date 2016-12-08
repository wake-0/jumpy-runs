class Position

    attr_reader :x, :y, :direction

    def initialize(x, y, direction = :none)
        @x = x
        @y = y
        @direction = direction
    end

    def update(x, y)
        update_direction(x, y)
        @old_x = @x
        @old_y = @y
        @x = x
        @y = y
    end

    def update_direction(x, y)
        return if @x == x && @y == y

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

    def update_delta(x_delta, y_delta = 0)
        update(@x + x_delta, @y + y_delta)
    end

    def has_changed_in_x?
        @x != @old_x
    end
end