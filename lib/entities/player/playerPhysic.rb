require './lib/architecture/physicalComponent'
require './lib/architecture/position'
require './lib/architecture/input'

class PlayerPhysic < PhysicalComponent
    
    def initialize(position, input_x, input_y, player_graphic)
        super(position, input_x, input_y, player_graphic)
        @gravity = 8
        @jump_height = 150
        @jump_speed = 3
        @is_jumping = false
        @highest_point_reached = false
    end
    
    def update
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
            @jump_start = @position.y + @graphical_component.rectangle.height unless @is_jumping
            @is_jumping = true
            delta_y = -@input_y.delta * @jump_speed unless @highest_point_reached
        else
            @is_jumping = false
        end
        
        # Do nothing when down is pressed
        # @position.updateDelta(0, @input.delta) if @input.direction == :down
        
        delta_y = delta_y + gravity_delta
        @position.update_delta(delta_x, delta_y)
    end
    
    private
    def distance_to_ground
        ground_y = $map.get_ground(@graphical_component.rectangle)
        player_y = @position.y + @graphical_component.rectangle.height
        ground_y - player_y
    end
    
    def gravity_delta
        gravity_delta = 0
        gravity_delta = distance_to_ground if @highest_point_reached && distance_to_ground <= @gravity
        gravity_delta = @gravity if @highest_point_reached && distance_to_ground > @gravity
        
        # This is used to check if the highest point while jumping was reached
        @highest_point_reached = false if distance_to_ground == 0
        @highest_point_reached = true if !@is_jumping || (@jump_start - (@position.y + @graphical_component.rectangle.height)) >= @jump_height
        @is_jumping = false if @highest_point_reached

        gravity_delta
    end

end