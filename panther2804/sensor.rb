#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_lcd_20x4'

include Tinkerforge

class Sensor

  HOST = 'localhost'
  PORT = 4223
  UID = 'cKS' # Change to your UID

  def initialize
    @array = Array.new
    @index = 0
    @ipcon = IPConnection.new # Create IP connection
    @lcd = BrickletLCD20x4.new UID, @ipcon # Create device object

    @ipcon.connect HOST, PORT # Connect to brickd
    # Don't use device before ipcon is connected

    # Turn backlight on
    @lcd.backlight_on
  end

  def new_key
    @key = rand(4)
    @array.push @key
    write_line 0, 0, '--'
    sleep 0.5
    0.upto(@array.length-1) do |w|
    write_line 0, 0, @array[w].to_s
      sleep 0.5
      end
  end

  def show_and_test
    new_key

    @lcd.register_callback(BrickletLCD20x4::CALLBACK_BUTTON_PRESSED) do |button|
      key = @array[@index]
     # puts "Button Pressed: #{button + 1}"
      if button == key
        write_line 1, 0, "Richtig: #{@index}"
        @index += 1
        if @array.length == @index
          new_key
          @index = 0
        end
      else
        write_line 1, 0, 'falsch'
        @array = Array.new
        end
    end
  end

  def write_line x, y, text
    clear_line x
    @lcd.write_line x, y, text
  end

  def clear_line x
    @lcd.write_line(x, 0, " " * 20)
  end

  def disconnect
    @ipcon.disconnect
  end

end


sensor = Sensor.new
sensor.write_line 0, 0, "Hallo, Sensor"
sleep 1

sensor.show_and_test



puts 'Press key to exit'
$stdin.gets
sensor.disconnect
