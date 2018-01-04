class SlotNumbersForCarsWithColour < ValetCommand

    def execute(args=[])
        color = args[0]
        @valet.slot_numbers_for_cars_with_colour(colour)
    end

end