class RegistrationNumbersForCarsWithColour < ValetCommand

    def execute(args=[])
        color = args[0]
        @valet.registration_numbers_for_cars_with_colour(colour)
    end

end