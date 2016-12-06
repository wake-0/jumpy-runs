require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class PlayerGraphic < GraphicalComponent

    def initialize(position, window, character = 1)
        super(position, window)
        @width = @height = 32
        @image = Gosu::Image.load_tiles @window, './resources/characters.png', @width, @height, false
        @character = character
        setCharacterOffset
        @frame = @characterOffset
        @size = 2
    end

    def height
        @height * @size
    end

    def width
        @width * @size
    end

    def setCharacterOffset
        # This offset depends on the sprite
        @characterOffset = 0 if @character == 1
        @characterOffset = 23 if @character == 2
        @characterOffset ||= 46
    end

    def draw
        # Check if the x position has changed then the 
        # image also should change
        if position.hasChanged
            @frame = @characterOffset + (@frame + 1) % 18
        end

        # Find direction
        if position.direction == :right || position.direction == :left 
            @positionDirection = position.direction
        end
        
        # Draw image in left or right direction
        image = @image[@frame]
        if @positionDirection == :right
            image.draw position.x, position.y, 1, @size, @size
        elsif @positionDirection == :left
            image.draw position.x + width, position.y, 1, -@size, @size
        end
    end

end