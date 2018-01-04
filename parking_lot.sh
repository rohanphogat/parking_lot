#!/bin/bash
#!/usr/bin/env ruby

chmod +x parking_lot.rb

if [ -z "$1" ]
  then
    ruby parking_lot.rb
  else
    ruby parking_lot.rb "($PWD)/$1"
fi