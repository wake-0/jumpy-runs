class Camera

  def initialize (drawing_position, window)
    @drawing_position = drawing_position
    @window = window

    @width = window.width - 200
    @height = window.height - 200

    # This is the center rectangle
    camera_drawing_position = Position.new(0, 0, :none)
    camera_map_position = Position.new(window.width/2 - @width/2, window.height/2 - @height/2, :none)
    camera_view = View.new(camera_map_position, camera_drawing_position)
    @rectangle = Rectangle.new(camera_view, @width, @height)
  end

  def update(rectangle)
    return unless update_needed?(rectangle)

    # Update view_position so, that the player is always within the camera_center
    delta_x = 0
    delta_y = 0

    delta_x = x_distance_to_center(rectangle) unless @rectangle.intersect_x_view?(rectangle)
    delta_y = y_distance_to_center(rectangle) unless @rectangle.intersect_y_view?(rectangle)
    @drawing_position.update_delta(-delta_x, -delta_y)
  end

  def draw(game_finished)
    @rectangle.draw(@window) if $debug_mode
  end

  private
  def update_needed?(rectangle)
    !@rectangle.intersect_view?(rectangle)
  end

  def x_distance_to_center(rectangle)
    left = [@rectangle.top_left_x_view, rectangle.top_left_x_view].min
    left_delta = left - @rectangle.top_left_x

    right = [@rectangle.bottom_right_x_view, rectangle.bottom_right_x_view].max
    right_delta = right - @rectangle.bottom_right_x_view

    player_width = rectangle.width
    left_delta.abs > right_delta.abs ? left_delta + player_width : right_delta - player_width
  end

  def y_distance_to_center(rectangle)
    top = [@rectangle.top_left_y_view, rectangle.top_left_y_view].min
    top_delta = top - @rectangle.top_left_y_view

    bottom = [@rectangle.bottom_right_y_view, rectangle.bottom_right_y_view].max
    bottom_delta = bottom - @rectangle.bottom_right_y_view

    player_height = rectangle.height
    top_delta.abs > bottom_delta.abs ? top_delta + player_height : bottom_delta - player_height
  end
end