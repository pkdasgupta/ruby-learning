#!/usr/bin/env ruby

# -------------------------------------
# Classes and Objects
# - Inheritance
# --------------------------------------

require './modules/product'
require './modules/mobile'
require './modules/book'

p1 = Product.new("Phone", "14999")
b1 = Book.new("Ignited Minds", "250", "A.P.J.Abdul Kalam", "360")
m1 = Mobile.new("Moto X_Play", "14999", "Moto X", "Motorola")

puts "-----------------------------------"
puts p1.details
puts "-----------------------------------"
puts b1.details
puts "-----------------------------------"
puts m1.details
puts "-----------------------------------"
