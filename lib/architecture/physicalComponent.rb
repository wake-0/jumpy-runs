require_relative 'component'

class PhysicalComponent < Component

    def initialize(position, inputX, inputY, graphicalComponent)
        super(position)
        @inputX = inputX
        @inputY = inputY
        @graphicalComponent = graphicalComponent
    end

    def update
    end

end