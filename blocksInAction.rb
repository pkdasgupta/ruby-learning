#!/usr/bin/env ruby

# Examples

=begin

def myblock
    puts "Before Calling the block"
    yield
    puts "After Calling the block"
end

myblock {
    puts "Inside the block"
}

def calc (x, y)
    yield(x,y)
end

puts calc(30, 4) { |a, b| a / b.to_f }

=end

def factorial(num)
        yield (num)
end

n = gets.to_i
factorial(n) do 
        puts (n <= 1) ? 1 : (1..n).inject(1) { |prod, num| prod * num }
end

