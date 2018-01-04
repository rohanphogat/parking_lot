Dir["./parking_service/*.rb"].each {|file| require file }
Dir["./input_parser/*.rb"].each {|file| require file }

class Main

    def initialize
        @valet = Valet.new
        @parser = Parser.new
    end

    def call
    end

end