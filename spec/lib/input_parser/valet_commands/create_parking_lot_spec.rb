RSpec.describe CreateParkingLot do
    describe '#execute' do
        it 'should call create_parking_lots method for valet object' do
            parking_lot_size = 6
            mock_valet = spy('Valet')
            expect(mock_valet).to receive(:create_parking_lots).with(parking_lot_size)
            CreateParkingLot.new(mock_valet).execute(["#{parking_lot_size}"])
        end
    end
end