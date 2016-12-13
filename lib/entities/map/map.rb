require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require './lib/entities/obstacle/obstacleGraphic'
require_relative 'mapBackgroundGraphic'

class Map < GameObject

    def initialize (position, input_x, input_y, window)
        super(position, input_x, input_y, window)

        @map_graphic = MapBackgroundGraphic.new(position, window)
        add_component(@map_graphic)

        # Create a general map
        @obstacle_position = Position.new(100, 450)
        @obstacle_graphic = ObstacleGraphic.new(@obstacle_position, window)
        add_component(@obstacle_graphic)

        @obstacle_position2 = Position.new(200, 350)
        @obstacle_graphic2 = ObstacleGraphic.new(@obstacle_position2, window)
        add_component(@obstacle_graphic2)

        @obstacle_position3 = Position.new(300, 250)
        @obstacle_graphic3 = ObstacleGraphic.new(@obstacle_position3, window)
        add_component(@obstacle_graphic3)
        
        @obstacle_position4 = Position.new(364, 250)
        @obstacle_graphic4 = ObstacleGraphic.new(@obstacle_position4, window)
        add_component(@obstacle_graphic4)

        @obstacle_position5 = Position.new(428, 250)
        @obstacle_graphic5 = ObstacleGraphic.new(@obstacle_position5, window)
        add_component(@obstacle_graphic5)

        @obstacle_position6 = Position.new(492, 250)
        @obstacle_graphic6 = ObstacleGraphic.new(@obstacle_position6, window)
        add_component(@obstacle_graphic6)

        @obstacle_position7 = Position.new(556, 250)
        @obstacle_graphic7 = ObstacleGraphic.new(@obstacle_position7, window)
        add_component(@obstacle_graphic7)
    end

    def get_ground(rectangle)
        min_index = 0
        (1...@graphical_components.length).each { |i|
            gc = @graphical_components[i]
            if gc.in_range?(rectangle)
                min_value = @graphical_components[min_index].get_ground(rectangle)
                difference = gc.get_ground(rectangle) - rectangle.bottom_right_y
                min_index = i if difference >= 0 && difference < min_value
            end
        }
        
        @graphical_components[min_index].get_ground(rectangle)
    end

    def get_start_position
        Position.new(0, window.height, :right)
    end

end