class Valet
    def initialize
        @parking_lot_size = 0
        @parking_slots = []
    end

    def create_parking_lots(size)
        @parking_lot_size = size
        size.times do |i|
            @parking_slots << ParkingSlot.new(i+1)
        end
    end

    def create_car_and_park(reg_number, colour)
        car = Car.new(reg_number, colour)
        assign_parking_lot(car)
    end

    def assign_parking_lot(car)
        slot = nearest_vacant_parking_slot
        if slot.nil?
            puts 'Sorry, parking lot is full'
            return
        end
        slot.car = car
        car.parking_slot = slot
    end

    def vacate_parking_slot(slot_num)
        @parking_slots[slot_num-1] = nil
    end

    def nearest_vacant_parking
        @parking_slots.find{|slot| slot.car.nil?}
    end

    def registration_numbers_for_cars_with_colour(colour)
        puts @parking_slots.map{|slot| slot.car.reg_number if slot.car.colour == colour}.compact.join(', ')
    end

    def slot_numbers_for_cars_with_colour(colour)
        puts @parking_slots.map{|slot| slot.slot_number if slot.car.colour == colour}.compact.join(', ')
    end

    def slot_number_for_registration_number(reg_number)
       slot = @parking_slots.find{|slot| slot.car.reg_number == reg_number}
       puts slot.present? ? slot.slot_number : 'Not Found'
    end

    def status
    end

end