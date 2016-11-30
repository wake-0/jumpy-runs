# Game framework
require 'gosu'

# For import the file name is used instead of the class name
require_relative 'lib/player'
require_relative 'lib/map'
require_relative 'example/example'

class JumpyRuns < Gosu::Window

    def initialize width = 800, height = 600, fullscreen = false
        super
        self.caption = "Hello World"
        example = Example.new
        example.testStuff
    end

    def button_down id
        close if id == Gosu::KbEscape
    end

    def update
    end

    def draw
    end
end

JumpyRuns.new.show