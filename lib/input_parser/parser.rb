require_relative 'valet_commands/root_command.rb'
require 'byebug'
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
        # command_args = args.slice[1, args.length]
        command_args = args[1..-1]
        @commands[command_name].execute(command_args)
    end

end