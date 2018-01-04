RSpec.describe Valet do
    describe '#create_parking_lots' do
        it 'should create parking lots of provided size' do
            subject_valet = Valet.new
            expect(subject_valet.parking_lot_size).to eq(0)
            expect(subject_valet.parking_slots.length).to eq(0)
            subject_valet.create_parking_lots(5)
            expect(subject_valet.parking_lot_size).to eq(5)
            expect(subject_valet.parking_slots.length).to eq(5)
            expect(subject_valet.parking_slots.first).to be_an_instance_of(ParkingSlot)
        end
    end

    describe '#create_car_and_park' do
        it 'should create and park car in first available slot' do
            subject_valet = Valet.new
            subject_valet.create_parking_lots(5)
            expect(subject_valet).to receive(:puts).with("Allocated slot number: 1")
            subject_valet.create_car_and_park('KA-01-1234','Red')
            expect(subject_valet.parking_slots.first.car.reg_number).to eq('KA-01-1234')
            expect(subject_valet.parking_slots.first.car.colour).to eq('Red')
            expect(subject_valet.parking_slots.last.car).to be_nil
        end
        it 'should not create and park car if parking full' do
            subject_valet = Valet.new
            subject_valet.create_parking_lots(1)
            expect(subject_valet).to receive(:puts).with("Allocated slot number: 1")
            subject_valet.create_car_and_park('KA-01-1234','Red')
            expect(subject_valet).to receive(:puts).with("Sorry, parking lot is full")
            subject_valet.create_car_and_park('KA-01-1235','Red')
        end
    end

    describe '#vacate_parking_slot' do
        it 'should vacate provided parking slot' do
            subject_valet = Valet.new
            subject_valet.create_parking_lots(1)
            expect(subject_valet.parking_slots.last.car).to be_nil
            subject_valet.create_car_and_park('KA-01-1234','Red')
            expect(subject_valet.parking_slots.last.car).to_not be_nil
            subject_valet.vacate_parking_slot(1)
            expect(subject_valet.parking_slots.last.car).to be_nil
        end
    end

    describe '#date fetch and print' do
        it 'should fetch and print registration_numbers_for_cars_with_colour' do
            subject_valet = create_valet_with_data
            expect(subject_valet).to receive(:puts).with('KA-01-6789, KA-01-9999')
            subject_valet.registration_numbers_for_cars_with_colour('White')
        end

        it 'should fetch and print slot_numbers_for_cars_with_colour' do
            subject_valet = create_valet_with_data
            expect(subject_valet).to receive(:puts).with('1, 3')
            subject_valet.slot_numbers_for_cars_with_colour('Red')
        end

        it 'should fetch and print slot_number_for_registration_number' do
            subject_valet = create_valet_with_data
            expect(subject_valet).to receive(:puts).with(2)
            subject_valet.slot_number_for_registration_number('KA-01-6789')
        end

        it 'should fetch and print Not Found when slot_number_for_registration_number is not present' do
            subject_valet = create_valet_with_data
            expect(subject_valet).to receive(:puts).with('Not Found')
            subject_valet.slot_number_for_registration_number('KA-01-1122')
        end

        it 'should fetch and print status' do
            subject_valet = create_valet_with_data
            expect(subject_valet).to receive(:puts).with("Slot No. Registration No Colour")
            expect(subject_valet).to receive(:puts).with("1 KA-01-1234 Red")
            expect(subject_valet).to receive(:puts).with("2 KA-01-6789 White")
            expect(subject_valet).to receive(:puts).with("3 KA-01-0000 Red")
            expect(subject_valet).to receive(:puts).with("4 KA-01-9999 White")
            subject_valet.status
        end
    end

    def create_valet_with_data
        subject_valet = Valet.new
        subject_valet.create_parking_lots(4)
        subject_valet.create_car_and_park('KA-01-1234','Red')
        subject_valet.create_car_and_park('KA-01-6789','White')
        subject_valet.create_car_and_park('KA-01-0000','Red')
        subject_valet.create_car_and_park('KA-01-9999','White')
        return subject_valet
    end
end