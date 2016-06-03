#!/usr/bin/env ruby

# ------------------------------------------------------------------
# Problem Statement : 
# Write a Program that takes a set of names of Individuals,
# and abbreviates the first, middle and other names except the 
# last name by their first letter.
#
# Ex. : Netaji Subhash Chandra Bose as N.S.C.Bose
#
# Author : Prashant Dasgupta (prashant.dasgupta@yahoo.com) 
# ------------------------------------------------------------------

puts "\n\n ******** Name Abbreviator ******* \n"

def nameAbbreviator(name)
    print "\n Abbreviated Name : "
    name.split().each_with_index { |part, ind|
        if (ind == name.split().length - 1)
            print "#{part.capitalize}"
        else 
            print "#{part[0].to_s.capitalize}."
        end
    }
end

print "\n Please Enter a Name to Abbreviate : "
nameAbbreviator(gets.chomp)

puts "\n\n **** !! Thank You !! **** \n"

exit
