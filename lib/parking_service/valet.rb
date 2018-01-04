class Valet
    def initialize
        @parking_lot_size = 0
        @parking_slots = []
    end

    def create_parking_lots(size)
        puts "Created a parking lot with #{size} slots"
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
        puts "Allocated slot number: #{slot.slot_number}"
        slot.car = car
        car.parking_slot = slot
    end

    def vacate_parking_slot(slot_num)
        puts "Slot number #{slot_num} is free"
        @parking_slots[slot_num-1] = ParkingSlot.new(slot_num)
    end

    def nearest_vacant_parking_slot
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
       puts slot.nil? ?  'Not Found' : slot.slot_number
    end

    def status
        puts "Slot No. Registration No Colour"
        @parking_slots.each do |slot|
            if !slot.car.nil?
                puts "#{slot.slot_number} #{slot.car.reg_number} #{slot.car.colour}"
            end
        end
    end

end