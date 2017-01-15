class PlayerFactory

  def self.create_player(start_position, drawing_position, input_x, input_y, map, window)
    start_position.update_delta(16, -96)
    player_view = View.new(start_position, drawing_position)
    player = Player.new(player_view, input_x, input_y, window, map, 1)
    player
  end

end