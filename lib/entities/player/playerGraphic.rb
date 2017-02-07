require './lib/architecture/graphicalComponent'
require './lib/architecture/position'
require './lib/architecture/rectangle'

class PlayerGraphic < GraphicalComponent

        def initialize(view, window, player_setting)
        super(view, window, 20, 26)
        @cut_width = 6
        @cut_height  = 6
        @image = Gosu::Image.load_tiles(@window, './resources/characters.png', width + 2*@cut_width, height + @cut_height, false)
        # Character selection
        @player_setting = player_setting
        set_character_offset
        @frame = @character_offset
    end

    def draw(game_finished)
      position = view.map_position

      # Check if the x position has changed then the
      # image also should change
      if position.has_changed_in_x? && !game_finished
          @frame = @character_offset + (@frame + 1) % 18
      end

      # Find direction
      if position.direction == :right || position.direction == :left
          @position_direction = position.direction
      end

      # Draw image in left or right direction
      uncut_image = @image[@frame]

      # Subimage for better fit
      image = uncut_image.subimage(@cut_width, @cut_height, width, height)

      if @position_direction == :right
          image.draw(rectangle.top_left_x_view, rectangle.top_left_y_view, 1, view.zoom_factor, view.zoom_factor)
      elsif @position_direction == :left
          image.draw(rectangle.top_left_x_view + resized_width, rectangle.top_left_y_view, 1, -view.zoom_factor, view.zoom_factor)
      end

      rectangle.draw(@window) if $debug_mode
    end

    private
    def set_character_offset
        # This offset depends on the sprite
        @character_offset = 0 if @player_setting.character == 1
        @character_offset = 23 if @player_setting.character == 2
        @character_offset ||= 46
    end
end