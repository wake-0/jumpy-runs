require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent
    
    def initialize(view, input_x, input_y, player_graphic, player_setting, map)
        super(view, input_x, input_y, player_graphic)
        @map = map
        @player_setting = player_setting
        @is_jumping = false
        @highest_point_reached = false
    end
    
    def update
        position = view.map_position
        delta_x = 0
        delta_y = 0
        
        if @input_x.direction == :right
            delta_x = @input_x.delta
        elsif @input_x.direction == :left
            delta_x = -@input_x.delta
        elsif @input_x.direction == :none
            delta_x = 0
        end
        
        if @input_y.direction == :top
            @jump_start_position = position.y + @graphical_component.resized_height unless @is_jumping
            @is_jumping = true
            delta_y = -@input_y.delta * @player_setting.jump_speed unless @highest_point_reached
        else
            @is_jumping = false
        end
        
        # Do nothing when down is pressed
        # @position.updateDelta(0, @input.delta) if @input.direction == :down
        
        delta_y = delta_y + gravity_delta
        position.update_delta(delta_x, delta_y)
    end
    
    private
    def distance_to_ground
        ground_y = @map.get_ground(@graphical_component.rectangle)
        player_y = view.map_position.y + @graphical_component.resized_height
        ground_y - player_y
    end
    
    def gravity_delta
        gravity_delta = 0
        gravity_delta = distance_to_ground if @highest_point_reached && distance_to_ground <= @player_setting.gravity
        gravity_delta = @player_setting.gravity if @highest_point_reached && distance_to_ground > @player_setting.gravity
        
        # This is used to check if the highest point while jumping was reached
        @highest_point_reached = false if distance_to_ground == 0
        @highest_point_reached = true if !@is_jumping || jump_height_reached?
        @is_jumping = false if @highest_point_reached

        gravity_delta
    end

    def jump_height_reached?
        jump_position = view.map_position.y + @graphical_component.resized_height
        (@jump_start_position - jump_position) >= @player_setting.jump_height
    end
end