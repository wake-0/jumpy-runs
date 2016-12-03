class PlayerGraphic < Component

    def initialize(gameObject = nil, character = 1)
        super(gameObject)
        @width = @height = 32
        @image = Gosu::Image.load_tiles $window, "resources/characters.png", @width, @height, false
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

    def draw move
        if move.hasChanged
            @frame = @characterOffset + (@frame + 1) % 18
        end

        image = @image[@frame]
        if move.direction == :right
            image.draw move.xPos, move.yPos, 1, @size, @size
        elsif move.direction == :left
            image.draw move.xPos + 2*@width, move.yPos, 1, -@size, @size
        end
    end

end