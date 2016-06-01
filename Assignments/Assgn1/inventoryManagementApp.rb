#!/usr/bin/env ruby

# ------------------------------------------------------------------------------------------
# Problem Statement : 
# Implement a CLI App for Inventory Management at an Electronics Store 
# that takes Product Name as input and retrives stock Quantity and Price for that Product.
#
# - Create a class : Product 
# - classAttributes : name, price, units, min_stock and max_stock
# - Create a Menu-driven application to keep track of Inventory of Products.
# - Menues should also feature the below :
#       1. Add to Stock
#       2. Retrive from Stock
#       3. Total worth of Stock Inventory
#       4. Highest Number of Products in Inventory
#       5. Alert User when Product stock is approaching  Minimum or Maximum Stock
#
# Author : Prashant Dasgupta (prashant.dasgupta@yahoo.com) 
# -------------------------------------------------------------------------------------------

BEGIN {
    puts "\n\n **** Inventory Manager **** \n"
}

END {
    puts "\n\n **** !! Thank You !! **** \n"
}


# Product Class with its Attributes and Necessary Methods
class Product
    attr_accessor :name, :price, :units, :min_stock, :max_stock
    @@products = []  # Array to store Product Objects

    # Product class Constructor to initialize the attributes of Product Objects
    def initialize(name = " ", price = 0, units = 0, min_stock = 0, max_stock = 0)
        @name = name
        @price = price
        @units = units
        @min_stock = min_stock
        @max_stock = max_stock
    end

    #Method to Register a New Product
    def addProduct
        p = Product.new

        print "\n\nEnter Product Name : "
        p.name = gets.chomp

        print "Enter per unit Price of #{p.name} : "
        p.price = gets.chomp

        print "Enter initial Number of units of #{p.name} to Add : "
        p.units = gets.to_i

        print "Enter Minimum Stock units for #{p.name} : "
        p.min_stock = gets.to_i
        
        print "Enter Maximum Stock units for #{p.name} : "
        p.max_stock = gets.to_i

        @@products << p
    end

    #Method to display the Registered Products
    def listProducts
        @@products.each_with_index { |p, i|
            puts "#{i + 1}. #{p.name}"
        }
    end

    #Method to add/remove units to Inventory for a Product
    def modInventory(opn)
        listProducts

        print "Please Choose the Product : "
        prod = @@products[gets.to_i - 1]

        if opn == "add"
            print "Please provide number of Units to be added to Inventory : "
            units = gets.to_i
            if prod.max_stock < (prod.units + units)
                prod.units += units
            else 
                puts "Oops! Maximum stock limit is getting exceeded. We can not accomodate #{units}-more units! :("
            end

            if prod.max_stock - prod.units < 10
                puts "\n ***** Inventory Alert ***** \n We can only #{prod.max_stock - prod.units} more Units. \n Please do the needful to release some Inventory."
            end
        end

        if opn == "remove"
            print "Please provide number of Units to be removed from Inventory : "
            units = gets.to_i
            if prod.min_stock > (prod.units - units)
                prod.units -= units
            else 
                puts "Oops! Minimum stock limit is getting exceeded. We can not release #{units}-more units! :("
            end

            if prod.units - prod.min_stock < 10
                puts "\n ***** Inventory Alert ***** \n We have only #{prod.units} more Units. \n Please do the needful to release some Inventory."
            end
        end
    end

    #Method to get worth details of Current Inventory
    def worthInventory
        total_worth = 0
        @@products.each_with_index { |p, i|
            prod_worth  = (p.price * p.units)
            total_worth = total_worth + prod_worth

            puts "#{i + 1} : #{p.name} - #{p.units} at INR Rs.#{p.price} each : INR Rs.#{prod_worth}"
        }

        puts "--" * 20
        puts "Total Inventory Worth : INR Rs.#{total_worth}"
        puts "--" * 20
    end

    #Method to facilitate User-Actions
    def Product.getUserActions
        loop = "y"
        while (loop == "y")
            puts "\n 1. Register a New Product."
            puts "\n 2. Add units of a Product to Inventory."
            puts "\n 3. Remove units of a Product from Inventory."
            puts "\n 4. View Stock Inventory worth Details."
            puts "\n 5. List Products with Highest stocks in Inventory."
            puts "\n 6. List Products with Lowest stocks in Inventory."
            
            d = Product.new  #Dummy Product Object to facilitate method Calls

            print "\n Please Choose your Option : "
            choice = gets.to_i

            case choice
            when 1
                d.addProduct
            when 2
                d.modInventory("add")
            when 3
                d.modInventory("remove")
            when 4
                d.worthInventory

            when 5

            when 6

            else 
                puts "\n Aah.. We don't have that Option yet !"
            end

            print "\n In a mood to further continue? (y/n) : "
            loop = gets.chomp
        end
    end

end

# Method Call to start App : class method (Called without instanising the Product class)
Product.getUserActions

exit
