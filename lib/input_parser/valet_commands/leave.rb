class Leave < RootCommand

    def execute(args=[])
        slot_num = args[0].to_i
        @valet.vacate_parking_slot(slot_num)
    end

end