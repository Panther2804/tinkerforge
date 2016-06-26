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

ipcon = IPConnection.new # Create IP connection
io16 = BrickletIO16.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

puts 'ok'
io16.set_port_configuration 'a', 1 << 0, 'o', false
io16.set_port_configuration 'a', 1 << 1, 'o', false
io16.set_port_configuration 'a', 1 << 2, 'o', false
io16.set_port_configuration 'a', 1 << 3, 'o', false
io16.set_port_configuration 'a', 1 << 4, 'o', false
io16.set_port_configuration 'a', 1 << 5, 'o', false
io16.set_port_configuration 'a', 1 << 6, 'o', false
io16.set_port_configuration 'a', 1 << 7, 'o', false
io16.set_port_configuration 'b', 1 << 0, 'o', false
io16.set_port_configuration 'b', 1 << 1, 'o', false
io16.set_port_configuration 'b', 1 << 2, 'o', false
io16.set_port_configuration 'b', 1 << 3, 'o', false
io16.set_port_configuration 'b', 1 << 4, 'o', false
io16.set_port_configuration 'b', 1 << 5, 'o', false
io16.set_port_configuration 'b', 1 << 6, 'o', false
io16.set_port_configuration 'b', 1 << 7, 'o', false

ipcon.disconnect
