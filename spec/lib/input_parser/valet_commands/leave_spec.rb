RSpec.describe Leave do
    describe '#execute' do
        it 'should call vacate_parking_slot method for valet object' do
            slot_number = 2
            mock_valet = spy('Valet')
            expect(mock_valet).to receive(:vacate_parking_slot).with(slot_number)
            Leave.new(mock_valet).execute(["#{slot_number}"])
        end
    end
end