require './lib/architecture/graphicalComponent'
require './lib/architecture/position'
require './lib/architecture/rectangle'

class StatisticGraphic < GraphicalComponent

  def initialize(position, window, statistic_settings)
    super(position, window, 120, statistic_settings.font_size, 1)
    @font = Gosu::Font.new(window , statistic_settings.font_name, statistic_settings.font_size)
  end

  def draw
    @font.draw('Play time:' + play_time, rectangle.top_left_x, rectangle.top_left_y, 1)

    rectangle.draw(@window) if $debug_mode
  end

  private
  def play_time
    (Gosu::milliseconds() / 1000).to_s
  end

end