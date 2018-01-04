# parking_lot

## Requirements

* Ruby v2.3.1

## Gems required
* rspec-rails

## Usage
```
git clone https://github.com/rohanphogat/parking_lot.git
cd parking_lot
rspec
```

To run with given inputs.txt file
```
./parking_lot.sh 'inputs.txt'
```

To run with interactive console
```
./parking_lot.sh
```

## Code Structure and Design
```
- parking_lot.sh - shell script to run project
- parking_lot.rb - ruby script called by shell script above
- main.rb - initializes Valet and Parser classes, and sends input from file/STDIN to Parser

#Using Command Design Pattern for input parsing
# lib/input_parser
- parser.rb
    parses input and calls appropriate command class
- valet_commands/*.rb
    this folder contains a class for each kind of input command and takes action accordingly
    root_command.rb holds the parent class

#Parking Service
# lib/parking_service/
- valet.rb
    maintains the list of parking slots
    contains logic for all changes and data fetching of parking slots
- car.rb
    class for car object
- parking_slot.rb
    class for parking slot object

# spec/
- 25 unit tests written covering 100% of the code
```