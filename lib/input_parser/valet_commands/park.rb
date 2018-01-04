class Park < RootCommand

    def execute(args=[])
        car_reg_number = args[0]
        car_colour = args[1]
        @valet.create_car_and_park(car_reg_number, car_colour)
    end

end