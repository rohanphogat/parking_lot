class Status < RootCommand

    def execute(args=[])
        @valet.status
    end
end