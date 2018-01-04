class CreateParkingLot < RootCommand

    def execute(args=[])
        size = args[0].to_i
        @valet.create_parking_lots(size)
    end

end