class CameraCenter

  attr_reader :camera

  def initialize (camera, window)
    @camera = camera
    @window = window

    @width = 200
    @height = 200
    camera.map_position.update_delta(-@width/2, -@height/2)
    @rectangle = Rectangle.new(camera, @width, @height)
  end

  def update(rectangle)
    if update_needed?(rectangle)
      # Update view_position so, that the player is always within then
      # camera_center
      delta_x = 0
      delta_y = 0

      delta_x = x_distance_to_center(rectangle) unless @rectangle.intersect_x?(rectangle)
      delta_y = y_distance_to_center(rectangle) unless @rectangle.intersect_y?(rectangle)
      camera.view_position.update_delta(-delta_x, -delta_y)
    end
  end

  def draw
    @rectangle.draw(@window)
  end

  private
  def update_needed?(rectangle)
    !@rectangle.intersect_view?(rectangle)
  end

  def x_distance_to_center(rectangle)
    left = [@rectangle.top_left_x, rectangle.top_left_x].min
    left_delta = left - @rectangle.top_left_x

    right = [@rectangle.bottom_right_x, rectangle.bottom_right_x].max
    right_delta = right - @rectangle.bottom_right_x
 s
    left_delta.abs > right_delta.abs ? left_delta : right_delta
  end

  def y_distance_to_center(rectangle)
    top = [@rectangle.top_left_y, rectangle.top_left_y].min
    top_delta = top - @rectangle.top_left_y

    bottom = [@rectangle.bottom_right_y, rectangle.bottom_right_y].max
    bottom_delta = bottom - @rectangle.bottom_right_y

    top_delta.abs > bottom_delta.abs ? top_delta : bottom_delta
  end
end