# Game framework
require 'gosu'

# For import the file name is used instead of the class name
require './lib/entities/player/player'
require './lib/entities/map/map'
require './lib/entities/statistic/statistic'
require './lib/architecture/position'
require './lib/architecture/input'
require './lib/architecture/camera'

class JumpyRuns < Gosu::Window

    def initialize(width = 800, height = 600, fullscreen = false)
        super
        $debug_mode = true

        self.caption = 'Jumpy Runs'
        @moving_speed = 7

        @input_x = Input.new(:none, 0)
        @input_y = Input.new(:none, 0)
        @view_position = Position.new(0, 0, :none)

        @map_position = Position.new(0, 0, :none)
        @map_camera = Camera.new(@map_position, @view_position)
        @map = Map.new(@map_camera, @input_x, @input_y, self)

        @statistic_position = Position .new(0, 0, :none)
        @statistic_camera = Camera.new(@statistic_position, @view_position)
        @statistic = Statistic.new(@statistic_camera, @input_x, @input_y, self)

        #@player_position = Position.new(30 - 16, self.height - 96, :right)
        @player_position = @map.get_start_position
        @player_position.update_delta(16, -96)
        @player_camera = Camera.new(@player_position, @view_position, 1)
        @player = Player.new(@player_camera, @input_x, @input_y, self, @map, 1)
    end

    def button_down(id)
        close if id == Gosu::KbEscape
        $debug_mode = !$debug_mode if id == Gosu::KbD
    end

    def update
        if self.button_down? Gosu::KbRight
            @input_x.update(:right, @moving_speed)
        elsif self.button_down? Gosu::KbLeft
            @input_x.update(:left, @moving_speed)
        else
            @input_x.update(:none, 0)
        end
        
        if self.button_down? Gosu::KbDown
            @input_y.update(:down, @moving_speed)
        elsif self.button_down? Gosu::KbUp
            @input_y.update(:top, @moving_speed)
        else
            @input_y.update(:none, 0)
        end

        @player.update
    end

    def draw
        @map.draw
        @statistic.draw
        @player.draw
    end
end

JumpyRuns.new.show