# Game framework
require 'gosu'

# For import the file name is used instead of the class name
require './lib/entities/player/player'
require './lib/entities/map/map'
require './lib/entities/statistic/statistic'
require './lib/game/camera/camera'
require './lib/game/controller/gameController'
require './lib/entities/goal/goal'
require './lib/architecture/position'
require './lib/architecture/input'
require './lib/architecture/view'

class JumpyRuns < Gosu::Window

    def initialize(width = 800, height = 600, fullscreen = false)
      super
      $debug_mode = true

      self.caption = 'Jumpy Runs'
      @moving_speed = 5

      @input_x = Input.new(:none, 0)
      @input_y = Input.new(:none, 0)
      @drawing_position = Position.new(0, 0, :none)

      @map_position = Position.new(0, 0, :none)
      @map_view = View.new(@map_position, @drawing_position, 1)
      @map = Map.new(@map_view, @input_x, @input_y, self)

      @goal_position = @map.get_goal_position
      @goal_position.update_delta(8, -16)
      @goal_view = View.new(@goal_position, @drawing_position, 1)
      @goal = Goal.new(@goal_view, @input_x, @input_y, self)

      @statistic_map_position = Position.new(0, 0, :none)
      @statistic_drawing_position = Position.new(0, 0, :none)
      @statistic_view = View.new(@statistic_map_position, @statistic_drawing_position)
      @statistic = Statistic.new(@statistic_view, @input_x, @input_y, self)

      @player_position = @map.get_start_position
      @player_position.update_delta(16, -96)
      @player_view = View.new(@player_position, @drawing_position, 1)
      @player = Player.new(@player_view, @input_x, @input_y, self, @map, 1)

      @camera = Camera.new(@drawing_position, self)

      @game_controller = GameController.new(@player, @goal, @statistic, self)
      @game_finished = false
    end

    def button_down(id)
        close if id == Gosu::KbEscape
        $debug_mode = !$debug_mode if id == Gosu::KbD
    end

    def update
      return if @game_finished

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
      @camera.update(@player.rectangle)
      @game_finished = @game_controller.finished?
    end

    def draw
        @map.draw
        @statistic.draw
        @player.draw
        @camera.draw
        @goal.draw
        @game_controller.draw
    end
end

JumpyRuns.new.show