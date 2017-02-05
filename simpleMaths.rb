#!/usr/bin/env ruby

# ---------------------------------------------------------------------------------
#  Program to find the sum of number between 200 and 300, which is multiple of 3
# ---------------------------------------------------------------------------------

puts "\n\n *************** DivSum3 ******************** \n"

sum = 0
print "\n ("

(200..300).each{ |num|
    if (num % 3 == 0)
        print "#{num} +"
        sum += num
    end
}

print ") = #{sum}"

puts "\n\n *************** !! Thanks !! ******************** \n"



