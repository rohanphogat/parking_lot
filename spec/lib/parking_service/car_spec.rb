RSpec.describe Car do
    describe 'class attributes' do
        it 'should assign and get reg_number, colour, parking_slot' do
            car = Car.new('KA-01-1234', 'Red')
            car.parking_slot = 'parking_slot'
            expect(car.reg_number).to eq('KA-01-1234')
            expect(car.colour).to eq('Red')
            expect(car.parking_slot).to eq('parking_slot')
        end
    end
end