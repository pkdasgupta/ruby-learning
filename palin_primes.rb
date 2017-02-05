#!/usr/bin/env ruby

# Enter your code here. Read input from STDIN. Print output to STDOUT

def prime? (num)
    return (num <= 1) ? false : (2...num).none? { |n| num%n == 0 }
end

def palin? (str)
    return (str.to_s == str.to_s.reverse) ? true : false
end

palin_primes = -> (n) do 
    1.upto(Float::INFINITY).lazy.select { |x| (prime? x and palin? x) }.first(n)
end

num = gets.chomp.to_i
pps = palin_primes.(num)

puts pps
