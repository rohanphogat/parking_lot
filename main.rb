require 'byebug'
Dir["./lib/input_parser/*.rb"].each {|file| require_relative file }
Dir["./lib/input_parser/*/*.rb"].each {|file| require_relative file }
Dir["./lib/parking_service/*.rb"].each {|file| require_relative file }

class Main

    def initialize(mode=0)
        @mode = mode
        @valet = Valet.new
        @parser = Parser.new(@valet)
    end

    def call(input_file = nil)
        case @mode
            when 0
                #interactive mode
                # puts "Enter input command, type command 'exit' to stop"
                while true
                    input_cmd = gets()
                    if input_cmd.strip == 'exit'
                        break
                    else
                        @parser.parse_and_execute_input(input_cmd)
                    end
                end
            when 1
                #input file mode
                input_cmds = File.readlines(input_file)
                input_cmds.each {|cmd| @parser.parse_and_execute_input(cmd.strip)}
            else
                puts 'Invalid input mode'
        end
    end
end
