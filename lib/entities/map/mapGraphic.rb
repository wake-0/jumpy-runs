require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class MapGraphic < GraphicalComponent

    def initialize(position)
        super(position)
        @color ||= Gosu::Color.new(0xaaaaccaa)
        @color2 ||= Gosu::Color.new(0xaa123452)
    end

    def draw
        $window.draw_quad(
            0,              0,               @color,
            $window.width,  0,               @color,
            0,              $window.height,  @color2,
            $window.width,  $window.height,  @color2,
            0
        )
    end

end