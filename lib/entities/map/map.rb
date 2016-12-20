require './lib/architecture/gameObject'
require './lib/architecture/position'
require './lib/architecture/input'
require './lib/entities/obstacle/obstacleGraphic'
require_relative 'mapBackgroundGraphic'
require_relative 'mapSettings'

class Map < GameObject

    def initialize (view, input_x, input_y, window)
        super(view, input_x, input_y, window)

        map_settings = MapSettings.new(window.width, window.height)
        map_graphic = MapBackgroundGraphic.new(view, window, map_settings)
        add_component(map_graphic)

        # Create a general map
        create_obstacles(window)
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
        Position.new(450, 300, :right)
    end

    private
    def create_obstacles(window)
        @obstacle_position1 = Position.new(100, 450)
        @obstacle_camera1 = View.new(@obstacle_position1, view.drawing_position, view.zoom_factor)
        @obstacle_graphic1 = ObstacleGraphic.new(@obstacle_camera1, window)
        add_component(@obstacle_graphic1)

        @obstacle_position2 = Position.new(200, 350)
        @obstacle_camera2 = View.new(@obstacle_position2, view.drawing_position, view.zoom_factor)
        @obstacle_graphic2 = ObstacleGraphic.new(@obstacle_camera2, window)
        add_component(@obstacle_graphic2)

        @obstacle_position3 = Position.new(300, 250)
        @obstacle_camera3 = View.new(@obstacle_position3, view.drawing_position, view.zoom_factor)
        @obstacle_graphic3 = ObstacleGraphic.new(@obstacle_camera3, window)
        add_component(@obstacle_graphic3)

        @obstacle_position4 = Position.new(364, 250)
        @obstacle_camera4 = View.new(@obstacle_position4, view.drawing_position, view.zoom_factor)
        @obstacle_graphic4 = ObstacleGraphic.new(@obstacle_camera4, window)
        add_component(@obstacle_graphic4)

        @obstacle_position5 = Position.new(428, 250)
        @obstacle_camera5 = View.new(@obstacle_position5, view.drawing_position, view.zoom_factor)
        @obstacle_graphic5 = ObstacleGraphic.new(@obstacle_camera5, window)
        add_component(@obstacle_graphic5)

        @obstacle_position6 = Position.new(492, 250)
        @obstacle_camera6 = View.new(@obstacle_position6, view.drawing_position, view.zoom_factor)
        @obstacle_graphic6 = ObstacleGraphic.new(@obstacle_camera6, window)
        add_component(@obstacle_graphic6)

        @obstacle_position7 = Position.new(556, 250)
        @obstacle_camera7 = View.new(@obstacle_position7, view.drawing_position, view.zoom_factor)
        @obstacle_graphic7 = ObstacleGraphic.new(@obstacle_camera7, window)
        add_component(@obstacle_graphic7)

        @obstacle_position8 = Position.new(300, 130)
        @obstacle_camera8 = View.new(@obstacle_position8, view.drawing_position, view.zoom_factor)
        @obstacle_graphic8 = ObstacleGraphic.new(@obstacle_camera8, window)
        add_component(@obstacle_graphic8)

        @obstacle_position9 = Position.new(200, 50)
        @obstacle_camera9 = View.new(@obstacle_position9, view.drawing_position, view.zoom_factor)
        @obstacle_graphic9 = ObstacleGraphic.new(@obstacle_camera9, window)
        add_component(@obstacle_graphic9)
    end

end