require_relative 'rectangle'

class Camera

  attr_reader :map_position, :view_position, :zoom_factor

  def initialize(map_position, view_position, zoom_factor = 1)
    @map_position = map_position
    @view_position = view_position
    @zoom_factor = zoom_factor
  end


end