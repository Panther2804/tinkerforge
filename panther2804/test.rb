#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_io16'

include Tinkerforge

class Io16

  HOST = 'localhost'
  PORT = 4223
  UID = 'b9h' # Change to your UID
  # 'a' or 'b'
  IOSITE = 'b'

  @ipcon = nil
  @io16 = nil

  def initialize
    @ipcon = IPConnection.new # Create IP connection
    @io16 = BrickletIO16.new UID, @ipcon # Create device object

    @ipcon.connect HOST, PORT # Connect to brickd
    # Don't use device before ipcon is connected
  end

  def close
    @ipcon.disconnect
  end

  def on *x
    x.each do |i|
      @io16.set_port_configuration IOSITE, 1 << i, 'o', true
    end
  end

  def off *x
    x.each do |i|
      @io16.set_port_configuration IOSITE, 1 << i, 'o', false
    end
  end

end

io16 = Io16.new
io16.on 0
sleep 1
io16.on 1
sleep 1
io16.on 3
sleep 1
io16.on 4
sleep 1

io16.off 0, 1, 3, 4

io16.close

puts "test finished"
