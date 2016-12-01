# Game framework
require 'gosu'

# For import the file name is used instead of the class name
require_relative 'lib/player'
require_relative 'lib/map'

class JumpyRuns < Gosu::Window

    def initialize width = 800, height = 600, fullscreen = false
        super
        self.caption = "Jumpy Runs"

        @width = @height = 32
        @player = Gosu::Image.load_tiles self, "resources/characters.png", @width, @height, fullscreen
        @frame = 0
        @direction = :right
        @moving = false
        @x = self.width/2 - @width/2
        @y = self.height/2 - @height/2  
        @movingSpeed = 10
    end

    def button_down id
        close if id == Gosu::KbEscape
    end

    def update
        if self.button_down? Gosu::KbRight
            @direction = :right
            @x += @movingSpeed
            @moving = true
            @frame += 1
        elsif self.button_down? Gosu::KbLeft
            @direction = :left
            @x -= @movingSpeed
            @moving = true
            @frame += 1
        end
    end

    def draw
        # first line contains 23 character images - 5 climbing images
        f = @frame % 18
        image = @player[f]
        if @direction == :right
            image.draw @x, @y, 1, 2, 2
        elsif @direction == :left
            image.draw @x + 2*@width, @y, 1, -2, 2
        end
    end
end

JumpyRuns.new.show