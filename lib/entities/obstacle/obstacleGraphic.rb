require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class ObstacleGraphic < GraphicalComponent 

    def initialize(camera, window)
        super(camera, window, 32, 16)
        @image = Gosu::Image.load_tiles window, './resources/sheet.png', width, height, false
    end

    def draw
        frame = 12
        image = @image[frame]
        image.draw rectangle.top_left_x, rectangle.top_left_y, 1, camera.zoom_factor, camera.zoom_factor
        rectangle.draw(@window) if $debug_mode
    end

    def in_range?(rect)
        rectangle.intersect_x?(rect)
    end

    def get_ground(rect)
        rectangle.top_left_y
    end
end