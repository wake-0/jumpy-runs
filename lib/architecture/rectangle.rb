class Rectangle

  attr_reader :view, :width, :height

  def initialize(view, width, height)
    @view = view
    @width = width
    @height = height
  end

  def top_left_x
    view.map_position.x
  end

  def top_left_y
    view.map_position.y
  end

  def bottom_right_x
    top_left_x + @width
  end

  def bottom_right_y
    top_left_y + @height
  end

  def top_left_x_view
    top_left_x + view.drawing_position.x
  end

  def top_left_y_view
    top_left_y + view.drawing_position.y
  end

  def bottom_right_x_view
    bottom_right_x + view.drawing_position.x
  end

  def bottom_right_y_view
    bottom_right_y + view.drawing_position.y
  end

  def intersect?(rectangle)
    x_min = [top_left_x, rectangle.top_left_x].max
    y_min = [top_left_y, rectangle.top_left_y].max

    x_max = [bottom_right_x, rectangle.bottom_right_x].min
    y_max = [bottom_right_y, rectangle.bottom_right_y].min

    x_min < x_max && y_min < y_max
  end

  def intersect_view?(rectangle)
    x_min = [top_left_x_view, rectangle.top_left_x_view].max
    y_min = [top_left_y_view, rectangle.top_left_y_view].max

    x_max = [bottom_right_x_view, rectangle.bottom_right_x_view].min
    y_max = [bottom_right_y_view, rectangle.bottom_right_y_view].min

    x_min < x_max && y_min < y_max
  end

  def intersect_x_view?(rectangle)
    x_min = [top_left_x_view, rectangle.top_left_x_view].max
    x_max = [bottom_right_x_view, rectangle.bottom_right_x_view].min

    x_min < x_max
  end

  def intersect_y_view?(rectangle)
    y_min = [top_left_y_view, rectangle.top_left_y_view].max
    y_max = [bottom_right_y_view, rectangle.bottom_right_y_view].min

    y_min < y_max
  end

  # This method is used for test purposes
  def draw(window)
    window.draw_quad(top_left_x_view, top_left_y_view, 0x33ffffff,
                      bottom_right_x_view, top_left_y_view, 0x33ffffff,
                      bottom_right_x_view, bottom_right_y_view, 0x33ffffff,
                      top_left_x_view, bottom_right_y_view, 0x33ffffff, 100)
  end

end