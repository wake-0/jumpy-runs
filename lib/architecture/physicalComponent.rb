require_relative 'component'

class PhysicalComponent < Component

    def initialize(position, input)
        super(position)
        @input = input
    end

    def update
    end

end