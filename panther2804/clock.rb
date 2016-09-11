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

w = 0
while true
zeit = Time.new
puts zeit

zeit = zeit.to_s

zeit = zeit.split(" ")
zeit = zeit[1].split(":")

puts zeit

sek = zeit[2].to_i
min = zeit[1].to_i
h = zeit[0].to_i

sekb = Array.new
minb = Array.new
hb = Array.new



if h >= 32
hb[0] = 1 if
h -= 32
else
  hb[0] = 0
end

if h >= 16
hb[1] = 1 if
h -= 16
else
  hb[1] = 0
end

if h >= 8
hb[2] = 1
h -= 8
else
  hb[2] = 0
end

if h >= 4
hb[3] = 1
h -= 4
else
  hb[3] = 0
end

if h >= 2
hb[4] = 1
h -= 2
else
  hb[4] = 0
end

if h >=1
hb[5] = 1
h -= 1
else
  hb[5] = 0
end

puts '------------------'
puts h
puts '-------------------'
puts hb




puts '---------------------------'

if min >= 32
  minb[0] = 1
  min -= 32
else
  minb[0] = 0
end

if min >= 16
  minb[1] = 1
  min -= 16
else
  minb[1] = 0
end

if min >= 8
  minb[2] = 1
  min -= 8
else
  minb[2] = 0
end

if min >= 4
  minb[3] = 1
  min -= 4
else
  minb[3] = 0
end

if min >= 2
  minb[4] = 1
  min -= 2
else
  minb[4] = 0
end

if min >=1
  minb[5] = 1
  min -= 1
else
  minb[5] = 0
end

puts '------------------'
puts min
puts '-------------------'
puts minb

puts '---------------------------'

if sek >= 32
  sekb[0] = 1
  sek -= 32
else
  sekb[0] = 0
end

if sek >= 16
  sekb[1] = 1
  sek -= 16
else
  sekb[1] = 0
end

if sek >= 8
  sekb[2] = 1
  sek -= 8
else
  sekb[2] = 0
end

if sek >= 4
  sekb[3] = 1
  sek -= 4
else
  sekb[3] = 0
end

if sek >= 2
  sekb[4] = 1
  sek -= 2
else
  sekb[4] = 0
end

if sek >=1
  sekb[5] = 1
  sek -= 1
else
  sekb[5] = 0
end

puts '------------------'
puts sek
puts '-------------------'
puts sekb



  io16.on 7
  if hb[5] == 1
    io16.on 6
  else
    io16.off 6
  end

  if hb[4] == 1
    io16.on 5
  else
    io16.off 5
  end

  if hb[3] == 1
    io16.on 4
  else
    io16.off 4
  end

  if hb[2] == 1
    io16.on 3
  else
    io16.off 3
  end

  if hb[1] == 1
    io16.on 2
  else
    io16.off 2
  end

  if hb[0] == 1
    io16.on 1
  else
    io16.off 1
  end
  sleep 10
  io16.off 7
  ##################

  io16.on 0
  if minb[5] == 1
    io16.on 6
  else
    io16.off 6
  end

  if minb[4] == 1
    io16.on 5
  else
    io16.off 5
  end

  if minb[3] == 1
    io16.on 4
  else
    io16.off 4
  end

  if minb[2] == 1
    io16.on 3
  else
    io16.off 3
  end

  if minb[1] == 1
    io16.on 2
  else
    io16.off 2
  end

  if minb[0] == 1
    io16.on 1
  else
    io16.off 1
  end
  sleep 10
  io16.off 0

  #####################

  0.upto(10) do w

  zeit = Time.new
  puts zeit

  zeit = zeit.to_s

  zeit = zeit.split(" ")
  zeit = zeit[1].split(":")

  puts zeit

  sek = zeit[2].to_i
  min = zeit[1].to_i
  h = zeit[0].to_i

  if sek >= 32
    sekb[0] = 1
    sek -= 32
  else
    sekb[0] = 0
  end

  if sek >= 16
    sekb[1] = 1
    sek -= 16
  else
    sekb[1] = 0
  end

  if sek >= 8
    sekb[2] = 1
    sek -= 8
  else
    sekb[2] = 0
  end

  if sek >= 4
    sekb[3] = 1
    sek -= 4
  else
    sekb[3] = 0
  end

  if sek >= 2
    sekb[4] = 1
    sek -= 2
  else
    sekb[4] = 0
  end

  if sek >=1
    sekb[5] = 1
    sek -= 1
  else
    sekb[5] = 0
  end


  if sekb[5] == 1
    io16.on 6
  else
    io16.off 6
  end

  if sekb[4] == 1
    io16.on 5
  else
    io16.off 5
  end

  if sekb[3] == 1
    io16.on 4
  else
    io16.off 4
  end

  if sekb[2] == 1
    io16.on 3
  else
    io16.off 3
  end

  if sekb[1] == 1
    io16.on 2
  else
    io16.off 2
  end

    io16.on 1
  else
    io16.off 1
  end
    sleep 10
end

end


