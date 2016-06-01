#!/usr/bin/env ruby

# ------------------------------------------------------------------
# Problem Statement : 
# Write a Program to delete all vowels from a Sentence.
# Assuming that the Sentence is NOT more than 80-characters long.
#
# Author : Prashant Dasgupta (prashant.dasgupta@yahoo.com) 
# ------------------------------------------------------------------

puts "\n\n **** Vowel Remover Program **** \n"

print "Whats Up, Buddy ? : "
STDOUT.flush
input = gets.chomp

if input.length > 80
    puts "\n Oops! That's a long, long Sentence!"
else
    puts "\n Great, But I dont like Vowels : #{input.downcase.delete! ('a','e','i','o','u')}"
end

puts "\n\n **** !! Thank You !! **** \n"

exit
