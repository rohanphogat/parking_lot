require_relative 'main.rb'

input_file = ARGV[0]

if !input_file.nil?
    Main.new(1).call(input_file)
else
    Main.new(0).call
end