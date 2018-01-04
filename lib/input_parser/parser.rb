Dir["./valet_commands/*.rb"].each {|file| require file }

class Parser

    def initialize(valet)
        @valet = valet
        @commands = {
            'create_parking_lot' => CreateParkingLot.new(@valet),
            'park' => Park.new(@valet),
            'leave' => Leave.new(@valet),
            'status' => Status.new(@valet),
            'registration_numbers_for_cars_with_colour' => RegistrationNumbersForCarsWithColour.new(@valet),
            'slot_numbers_for_cars_with_colour' => SlotNumbersForCarsWithColour.new(@valet),
            'slot_number_for_registration_number' => SlotNumberForRegistrationNumber.new(@valet)
        }
    end

    def parse_and_execute_input(input_str)
        args = input_str.split(' ')
        command_name = args[0]
        command_args = args.drop[1, args.length]
        @commands[command].execute(command_args)
    end

end