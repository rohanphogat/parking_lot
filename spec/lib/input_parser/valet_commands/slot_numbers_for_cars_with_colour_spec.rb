RSpec.describe SlotNumbersForCarsWithColour do
    describe '#execute' do
        it 'should call slot_numbers_for_cars_with_colour method for valet object' do
            car_colour = 'KA-01-1234'
            mock_valet = spy('Valet')
            expect(mock_valet).to receive(:slot_numbers_for_cars_with_colour).with(car_colour)
            SlotNumbersForCarsWithColour.new(mock_valet).execute([car_colour])
        end
    end
end