require './lib/architecture/graphicalComponent'
require './lib/architecture/position'
require './lib/architecture/rectangle'

class StatisticGraphic < GraphicalComponent

  def initialize(view, window, statistic_settings)
    super(view, window, 120 * view.zoom_factor, statistic_settings.font_size)
    @font = Gosu::Font.new(window , statistic_settings.font_name, statistic_settings.font_size)
  end

  def draw
    @font.draw('Play time:' + play_time, rectangle.top_left_x_view, rectangle.top_left_y_view, 1, view.zoom_factor, view.zoom_factor)

    rectangle.draw(@window) if $debug_mode
  end

  private
  def play_time
    (Gosu::milliseconds() / 1000).to_s
  end

end