class PlayerSettings

    attr_reader :character, :gravity, :jump_height, :jump_speed

  def initialize (character, gravity, jump_height, jump_speed)
    @character = character
    @gravity = gravity
    @jump_height = jump_height
    @jump_speed = jump_speed
  end

end