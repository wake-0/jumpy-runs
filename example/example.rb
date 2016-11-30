class Example
    def testStuff
        string = 'Hello world'
        # puts adds automatically line ending
        puts string

        # print does not add a line ending
        print string + "\n"

        # Create new object 
        player = Player.new
        # Call the methods from the object
        player.jump
        player.goAhead
        player.goBack 

        # Does not work at the moment
        # and I don't understand why not
        map = Map.new
        puts map.getName
    end
end