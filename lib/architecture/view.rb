require_relative 'rectangle'

class View

  attr_reader :map_position, :drawing_position, :zoom_factor

  def initialize(map_position, drawing_position, zoom_factor = 1)
    @map_position = map_position
    @drawing_position = drawing_position
    @zoom_factor = zoom_factor
  end

end