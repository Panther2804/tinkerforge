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


require 'tinkerforge/bricklet_rotary_poti'

HOST = 'localhost'
PORT = 4223
UID = 'cEm' # Change to your UID

ipcon = IPConnection.new # Create IP connection
rp = BrickletRotaryPoti.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

q = 0





0.upto(1000) do q
w = rp.get_position
w += 150
w = w/1000.00
puts w

  io16.on 1
  sleep w
io16.on 2
  sleep w
io16.on 3
sleep w
io16.on 4
  sleep w
io16.on 5
io16.off 1
  sleep w
io16.on 6
io16.off 2
  sleep w
io16.off 3
  sleep w
io16.off 4
  sleep w
io16.off 5
  sleep w
io16.off 6
  sleep w
end



#0.upto(10000) do w
#io16.on 1,2,3,4,5,6
#  sleep 0.0001
#  io16.off 1,2,3,4,5,6
#  sleep 0.001
#end

io16.off 0, 1, 3, 4

io16.close

puts "test finished"
