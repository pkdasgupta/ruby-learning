#!/usr/bin/env ruby

# ------------------------------------------------------------------
# Problem Statement : 
# Write a Program that will read a Line and remove from it
# all occurances of the word 'the'
#
# Author : Prashant Dasgupta (prashant.dasgupta@yahoo.com) 
# ------------------------------------------------------------------

puts "\n\n **** 'The' Remover **** \n"

print "\n How is the Weather Today ? : "
inp = gets.chomp

puts "\n Cool. But what's that 'the' thing in Between ? I read : "
puts " #{inp.gsub!(/[tT]he/,'')}"

puts "\n\n **** !! Thank You !! **** \n"

exit
