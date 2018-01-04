class ValetCommand

    def initialize(valet)
        @valet = valet
    end

    def execute(args=[])
        raise "unimplemented command"
    end
end