class SlotNumberForRegistrationNumber < ValetCommand

    def execute(args=[])
        reg_number = args[0]
        @valet.slot_number_for_registration_number(reg_number)
    end

end