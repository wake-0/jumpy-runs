require './lib/architecture/graphicalComponent'
require './lib/architecture/position'
require './lib/architecture/rectangle'

class PlayerGraphic < GraphicalComponent

    def initialize(position, window, character = 1)
        super(position, window)

        @width = 32
        @height = 32
        @size = 2

        @image = Gosu::Image.load_tiles @window, './resources/characters.png', @width, @height, false
        # Abstract representation of the graphical component
        @rectangle = Rectangle.new(position, @width*@size, @height*@size)
        # Character selection
        @character = character
        set_character_offset
        @frame = @character_offset
    end

    def height
        @rectangle.height
    end

    def width
        @rectangle.width
    end

    def draw
        # Check if the x position has changed then the
        # image also should change
        if position.has_changed_in_x?
            @frame = @character_offset + (@frame + 1) % 18
        end

        # Find direction
        if position.direction == :right || position.direction == :left 
            @position_direction = position.direction
        end
        
        # Draw image in left or right direction
        image = @image[@frame]
        if @position_direction == :right
            image.draw position.x, position.y, 1, @size, @size
        elsif @position_direction == :left
            image.draw position.x + width, position.y, 1, -@size, @size
        end

        @rectangle.draw(@window) if $debug_mode
    end

    private
    def set_character_offset
        # This offset depends on the sprite
        @character_offset = 0 if @character == 1
        @character_offset = 23 if @character == 2
        @character_offset ||= 46
    end
end