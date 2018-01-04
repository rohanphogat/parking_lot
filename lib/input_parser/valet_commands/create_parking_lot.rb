class CreateParkingLot < ValetCommand

    def execute(args=[])
        size = args[0]
        @valet.create_parking_lots(size)
    end

end