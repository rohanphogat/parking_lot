RSpec.describe ParkingSlot do
    describe 'class attributes' do
        it 'should assign and get slot_number and car' do
            parking_slot = ParkingSlot.new(2)
            parking_slot.car = 'car'
            expect(parking_slot.slot_number).to eq(2)
            expect(parking_slot.car).to eq('car')
        end
    end
end