class Leave < ValetCommand

    def execute(args=[])
        slot_num = args[0]
        @valet.vacate_parking_slot(slot_num)
    end

end