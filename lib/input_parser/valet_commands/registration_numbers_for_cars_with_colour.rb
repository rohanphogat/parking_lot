class RegistrationNumbersForCarsWithColour < RootCommand

    def execute(args=[])
        colour = args[0]
        @valet.registration_numbers_for_cars_with_colour(colour)
    end

end