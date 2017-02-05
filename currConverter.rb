#!/usr/bin/env ruby

# ---------------------------------------------------------------
#  Program to convert Various Currency values in terms of INR
# ---------------------------------------------------------------

puts "\n\n *********** Currency Converter ******************** \n"

def currConverter
    dollars = { "INR" => 0.015, "YEN" => 0.0094, "YUAN" => 0.15, "GBP" => 1.31, "AUD" => 0.75 }

    print "\n Please Enter the Currency to Convert to INR (YEN | YUAN | GBP | AUD) : "
    curr = gets.chomp

    dval = dollars["#{curr}"]

    puts "\n 1 #{curr} = #{dval * 67.15} INR"
    print "\n Do you want to Continue? (Y/N) : "
    cont = gets.chomp

    return cont
end

cont = currConverter
while cont == "Y"
    currConverter
end
