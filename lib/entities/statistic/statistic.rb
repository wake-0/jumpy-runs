require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'statisticGraphic'
require_relative 'statisticSettings'

class Statistic < GameObject

  def initialize (camera, input_x, input_y, window)
    super(camera, input_x, input_y, window)

    statistic_settings = StatisticSettings.new
    statistic_graphic = StatisticGraphic.new(camera, window, statistic_settings)
    add_component(statistic_graphic)
  end
end