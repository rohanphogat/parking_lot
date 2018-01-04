RSpec.describe Park do
    describe '#execute' do
        it 'should call create_car_and_park method for valet object' do
            car_reg_number = 'KA-03-1234'
            car_colour = 'Red'
            mock_valet = spy('Valet')
            expect(mock_valet).to receive(:create_car_and_park).with(car_reg_number,car_colour)
            Park.new(mock_valet).execute(["#{car_reg_number}", car_colour])
        end
    end
end