require './lib/architecture/graphicalComponent'
require './lib/architecture/position'
require './lib/architecture/rectangle'

class GoalGraphic < GraphicalComponent

  def initialize(view, window)
    super(view, window, 16, 16)
    @image = Gosu::Image.load_tiles window, './resources/sheet.png', width, height, false
  end

  def draw(game_finished)
    frame = 14
    image = @image[frame]
    image.draw(rectangle.top_left_x_view, rectangle.top_left_y_view, 1, view.zoom_factor, view.zoom_factor)

    rectangle.draw(@window) if $debug_mode
  end

end