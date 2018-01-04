RSpec.describe Parser do
    describe '#parse_and_execute_input' do
        it 'should call the command for create_parking_lot' do
            mock_valet = spy('Valet')
            expect_any_instance_of(CreateParkingLot).to receive(:execute).with(['6'])
            Parser.new(mock_valet).parse_and_execute_input('create_parking_lot 6')
        end
        it 'should call the command for park' do
            mock_valet = spy('Valet')
            expect_any_instance_of(Park).to receive(:execute).with(['KA-03-1234', 'Red'])
            Parser.new(mock_valet).parse_and_execute_input('park KA-03-1234 Red')
        end
        it 'should call the command for leave' do
            mock_valet = spy('Valet')
            expect_any_instance_of(Leave).to receive(:execute).with(['6'])
            Parser.new(mock_valet).parse_and_execute_input('leave 6')
        end
        it 'should call the command for status' do
            mock_valet = spy('Valet')
            expect_any_instance_of(Status).to receive(:execute).with([])
            Parser.new(mock_valet).parse_and_execute_input('status')
        end
        it 'should call the command for registration_numbers_for_cars_with_colour' do
            mock_valet = spy('Valet')
            expect_any_instance_of(RegistrationNumbersForCarsWithColour).to receive(:execute).with(['Red'])
            Parser.new(mock_valet).parse_and_execute_input('registration_numbers_for_cars_with_colour Red')
        end
        it 'should call the command for slot_numbers_for_cars_with_colour' do
            mock_valet = spy('Valet')
            expect_any_instance_of(SlotNumbersForCarsWithColour).to receive(:execute).with(['White'])
            Parser.new(mock_valet).parse_and_execute_input('slot_numbers_for_cars_with_colour White')
        end
        it 'should call the command for slot_number_for_registration_number' do
            mock_valet = spy('Valet')
            expect_any_instance_of(SlotNumberForRegistrationNumber).to receive(:execute).with(['KA-03-1234'])
            Parser.new(mock_valet).parse_and_execute_input('slot_number_for_registration_number KA-03-1234')
        end
    end
end