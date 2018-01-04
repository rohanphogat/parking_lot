RSpec.describe SlotNumberForRegistrationNumber do
    describe '#execute' do
        it 'should call slot_number_for_registration_number method for valet object' do
            car_reg_number = 'KA-021-1234'
            mock_valet = spy('Valet')
            expect(mock_valet).to receive(:slot_number_for_registration_number).with(car_reg_number)
            SlotNumberForRegistrationNumber.new(mock_valet).execute([car_reg_number])
        end
    end
end