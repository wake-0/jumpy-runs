# Game framework
require 'gosu'

# For import the file name is used instead of the class name
require_relative 'lib/player'
require_relative 'lib/map'
require_relative 'lib/move'

class JumpyRuns < Gosu::Window

    def initialize width = 800, height = 600, fullscreen = false
        super
        self.caption = "Jumpy Runs"
        $window = self
        @movingSpeed = 7
        
        @player1 = Player.new(1)
        @movePlayer1 = Move.new(30 - 16, 30 - 16)

        @player2 = Player.new(2)
        @movePlayer2 = Move.new(30 - 16, 80 - 16)

        @player3 = Player.new(3)
        @movePlayer3 = Move.new(30 - 16, 130 - 16)
    end

    def button_down id
        close if id == Gosu::KbEscape
    end

    def update
        if self.button_down? Gosu::KbRight
            @movePlayer1.updateDelta(@movingSpeed, 0)
            @movePlayer2.updateDelta(@movingSpeed, 0)
            @movePlayer3.updateDelta(@movingSpeed, 0)
        elsif self.button_down? Gosu::KbLeft
            @movePlayer1.updateDelta(-@movingSpeed, 0)
            @movePlayer2.updateDelta(-@movingSpeed, 0)
            @movePlayer3.updateDelta(-@movingSpeed, 0)
        elsif self.button_down? Gosu::KbDown
            @movePlayer1.updateDelta(0, @movingSpeed)
            @movePlayer2.updateDelta(0, @movingSpeed)
            @movePlayer3.updateDelta(0, @movingSpeed)
        elsif self.button_down? Gosu::KbUp
            @movePlayer1.updateDelta(0, -@movingSpeed)
            @movePlayer2.updateDelta(0, -@movingSpeed)
            @movePlayer3.updateDelta(0, -@movingSpeed)
        else
            @movePlayer1.updateDelta(0, 0)
            @movePlayer2.updateDelta(0, 0)
            @movePlayer3.updateDelta(0, 0)
        end
    end

    def draw
        @player1.draw(@movePlayer1)
        @player2.draw(@movePlayer2)
        @player3.draw(@movePlayer3)
    end
end

JumpyRuns.new.show