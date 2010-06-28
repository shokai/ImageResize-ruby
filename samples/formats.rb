#!/usr/bin/env ruby
require 'rubygems'
require 'ImageResize'
#require '../lib/ImageResize'

puts 'formats:'
p Image.formats

puts 'read:'
p Image.read_formats

puts 'write:'
p Image.write_formats
