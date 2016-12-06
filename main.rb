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
        $window = self
        @movingSpeed = 7
        
        @input = Input.new(:none, 0)
        @playerPosition = Position.new(30 - 16, 30 - 16, :right)
        @player = Player.new(@playerPosition, @input, 1)

        @mapPosition = Position.new(0, 0, :none)
        @map = Map.new(@mapPosition, @input)
    end

    def button_down id
        close if id == Gosu::KbEscape
    end

    def update
        if self.button_down? Gosu::KbRight
            @input.update(:right, @movingSpeed)
        elsif self.button_down? Gosu::KbLeft
            @input.update(:left, @movingSpeed)
        elsif self.button_down? Gosu::KbDown
            @input.update(:down, @movingSpeed)
        elsif self.button_down? Gosu::KbUp
            @input.update(:top, @movingSpeed)
        else
            @input.update(:none, 0)
        end

        @player.update
    end

    def draw
        @map.draw
        @player.draw
    end
end

JumpyRuns.new.show