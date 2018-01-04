RSpec.describe Status do
    describe '#execute' do
        it 'should call status method for valet object' do
            mock_valet = spy('Valet')
            expect(mock_valet).to receive(:status).with(no_args)
            Status.new(mock_valet).execute([])
        end
    end
end