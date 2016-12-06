require_relative 'component'

class PhysicalComponent < Component

    def initialize(position, input, graphicalComponent)
        super(position)
        @input = input
        @graphicalComponent = graphicalComponent
    end

    def update
    end

end