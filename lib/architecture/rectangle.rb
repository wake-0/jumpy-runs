class Rectangle

  attr_reader :top_left_position, :width, :height

  def initialize(top_left_position, width, height)
    @top_left_position = top_left_position
    @width = width
    @height = height
  end

  def top_left_x
    @top_left_position.x
  end

  def top_left_y
    @top_left_position.y
  end

  def bottom_right_x
    @top_left_position.x + @width
  end

  def bottom_right_y
    @top_left_position.y + @height
  end

  def intersect?(rectangle)
    x_min = [top_left_x, rectangle.top_left_x].max
    y_min = [top_left_y, rectangle.top_left_y].max

    x_max = [bottom_right_x, rectangle.bottom_right_x].min
    y_max = [bottom_right_y, rectangle.bottom_right_y].min

    x_min < x_max && y_min < y_max
  end

  def intersect_x?(rectangle)
    x_min = [top_left_x, rectangle.top_left_x].max
    x_max = [bottom_right_x, rectangle.bottom_right_x].min

    x_min < x_max
  end

  # This method is used for test purposes
  def draw(window)
    window.draw_quad(top_left_x, top_left_y, 0x33ffffff,
                      bottom_right_x, top_left_y, 0x33ffffff,
                      bottom_right_x, bottom_right_y, 0x33ffffff,
                      top_left_x, bottom_right_y, 0x33ffffff, 100)
  end

end