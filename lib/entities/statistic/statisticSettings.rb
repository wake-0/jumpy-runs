class StatisticSettings

  attr_reader :font_name, :font_size

  def initialize(font_name = 'Verdana', font_size = 20)
    @font_name = font_name
    @font_size = font_size
  end
end