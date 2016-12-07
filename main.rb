# Game framework
require 'gosu'

# For import the file name is used instead of the class name
require './lib/entities/player/player'
require './lib/entities/map/map'
require './lib/architecture/position'
require './lib/architecture/input'

class JumpyRuns < Gosu::Window

    def initialize width = 800, height = 600, fullscreen = false
        super
        self.caption = "Jumpy Runs"
        @movingSpeed = 7
        
        @inputX = Input.new(:none, 0)
        @inputY = Input.new(:none, 0)

        @mapPosition = Position.new(0, 0, :none)
        $map = Map.new(@mapPosition, @inputX, @inputY, self)

        @playerPosition = Position.new(30 - 16, self.height - 96, :right)
        @player = Player.new(@playerPosition, @inputX, @inputY, self, 1)
    end

    def button_down id
        close if id == Gosu::KbEscape
    end

    def update
        if self.button_down? Gosu::KbRight
            @inputX.update(:right, @movingSpeed)
        elsif self.button_down? Gosu::KbLeft
            @inputX.update(:left, @movingSpeed)
        else
            @inputX.update(:none, 0)
        end
        if self.button_down? Gosu::KbDown
            @inputY.update(:down, @movingSpeed)
        elsif self.button_down? Gosu::KbUp
            @inputY.update(:top, @movingSpeed)
        else
            @inputY.update(:none, 0)
        end

        @player.update
    end

    def draw
        $map.draw
        @player.draw
    end
end

JumpyRuns.new.show