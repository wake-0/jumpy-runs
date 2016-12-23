class GameController

  attr_reader :player, :goal

  def initialize(player, goal, statistic, window)
    @player = player
    @goal = goal
    @statistic = statistic
    @font = Gosu::Font.new(window , 'Verdana', 20)
    @width = 100
    @height = 100
    @window = window
    drawing_position = Position.new(window.width/2 - @width/2, window.height/2 - @height/2, :none)
    map_position = Position.new(0, 0, :none)
    @view = View.new(map_position, drawing_position)
    @rectangle = Rectangle.new(@view, @width, @height)
    @duration = 0
    @finished = false
  end

  def draw
    return unless finished?
    @font.draw('Game finished: ' + @duration, @rectangle.top_left_x_view, @rectangle.top_left_y_view, 1, @view.zoom_factor, @view.zoom_factor)
    @rectangle.draw(@window) if $debug_mode
  end

  def finished?
    return true if @finished

    @finished = player.rectangle.intersect_view?(goal.rectangle)
    @duration = (Gosu::milliseconds() / 1000).to_s if @finished
    @finished
  end

end