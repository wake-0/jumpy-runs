require_relative 'gameObject'
require_relative 'playerGraphic'

class Player < GameObject

    def initialize (character = 2)
        # The parentheses () are needed because otherwise it tries
        # to call the super with the character parameter - this leads to 
        # an error
        super()
        addComponent(PlayerGraphic.new(self, character))
    end
end