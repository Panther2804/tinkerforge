#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_io16'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'b9h' # Change to your UID
# 'a' or 'b'
IOSITE = 'b'
IONUM = 1 << 5

ipcon = IPConnection.new # Create IP connection
io16 = BrickletIO16.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Register callback for interrupts
io16.register_callback(BrickletIO16::CALLBACK_INTERRUPT) do |port, interrupt_mask, value_mask|
  puts "Interrupt on port: #{port}"
  puts "Interrupt by: #{interrupt_mask.to_s 2}"
  puts "Value: #{value_mask.to_s 2}"
end

# Enable interrupt on pin 2 of port a
#io16.set_port_interrupt 'a', 1 << 2

# Set pin 0 on port a to output low
#io16.set_port_configuration 'a', 1 << 0, 'o', false

# Set pin 0 and 7 on port b to output high
#io16.set_port_configuration 'b', (1 << 0) | (1 << 7), 'o', true
puts 't aus eingeben:'
r1 = gets.chomp.to_f
puts 't an eingeben:'
r2 = gets.chomp.to_f
# io16.set_port_interrupt 'a', 1 << 0

0.upto(90) do
  io16.set_port_configuration IOSITE, IONUM, 'o', true
  puts "ein"
  sleep r1
  io16.set_port_configuration IOSITE, IONUM, 'o', false
  puts "aus"
  sleep r2
end

#io16.set_port_configuration 'a', 0xffff, 'o', false

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
