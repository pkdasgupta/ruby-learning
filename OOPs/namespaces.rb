#!/usr/bin/env ruby

# -------------------------------------
# Modules :
#   - Modules can not be instantiated
# NameSpaces :
#   - Have class or method that doesn't 
#     clashes with ruby classes
# --------------------------------------

module Namer
    class Indian
        def self.name
            ["Raju", "Rahul", "Raj", "Rakesh", "Ramesh"].sample
        end
    end

    class American
        def self.name
            ["Ron", "Russel", "Roger", "Rachel", "Russou"].sample
        end
    end
end

3.times do
    puts Namer::Indian.name
    puts Namer::American.name
end
