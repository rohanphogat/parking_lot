RSpec.describe RegistrationNumbersForCarsWithColour do
    describe '#execute' do
        it 'should call registration_numbers_for_cars_with_colour method for valet object' do
            car_colour = 'Red'
            mock_valet = spy('Valet')
            expect(mock_valet).to receive(:registration_numbers_for_cars_with_colour).with(car_colour)
            RegistrationNumbersForCarsWithColour.new(mock_valet).execute([car_colour])
        end
    end
end