require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require_relative 'goalGraphic'

class Goal < GameObject

  def initialize (view, input_x, input_y, window)
    super(view, input_x, input_y, window)

    goal_graphic = GoalGraphic.new(view, window)
    add_component(goal_graphic)
  end

end