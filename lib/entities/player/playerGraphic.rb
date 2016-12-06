require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class PlayerGraphic < GraphicalComponent

    def initialize(position, character = 1)
        super(position)
        @width = @height = 32
        @image = Gosu::Image.load_tiles $window, './resources/characters.png', @width, @height, false
        @character = character
        setCharacterOffset
        @frame = @characterOffset
        @size = 2
    end

    def setCharacterOffset
        # This offset depends on the sprite
        if @character == 1
            @characterOffset = 0 
        elsif @character == 2
            @characterOffset = 23
        else
            @characterOffset = 46
        end
    end

    def draw
        if position.hasChanged
            @frame = @characterOffset + (@frame + 1) % 18
        end

        if position.direction == :right || position.direction == :left 
            @positionDirection = position.direction
        end
        
        image = @image[@frame]
        if @positionDirection == :right
            image.draw position.x, position.y, 1, @size, @size
        elsif @positionDirection == :left
            image.draw position.x + 2*@width, position.y, 1, -@size, @size
        end
    end

end