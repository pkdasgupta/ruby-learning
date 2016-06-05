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
    puts "\n\n ***************** Inventory Manager ****************** \n"
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
        p.price = gets.to_i

        print "Enter initial Number of units of #{p.name} to Add : "
        p.units = gets.to_i

        print "Enter Minimum Stock units for #{p.name} : "
        p.min_stock = gets.to_i
        
        print "Enter Maximum Stock units for #{p.name} : "
        p.max_stock = gets.to_i

        if (p.min_stock <= p.units) and (p.units <= p.max_stock) and (p.min_stock < p.max_stock)
            @@products << p
            puts "\n Cool. Product details have been saved Successfully.\n\n"
            p.getProdbyName(p.name)
        else
            puts "\n Oops! Something went wrong while Registering the Product."
            puts "Looks like initial no. of Units dont fall in the range of Min and Max Stocks or Min Stock units exceed the Max Stock units."
            puts " Please give it a retry with Proper entries."
        end
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
            post_add_units = prod.units + units
            puts "post_add_units : #{post_add_units}, prod_max_stock : #{prod.max_stock}"

            if (prod.max_stock < post_add_units)
                prod.units += units
            else 
                puts "Oops! Maximum stock limit is getting exceeded. We can not accomodate #{units}-more units! :("
            end

            if prod.max_stock - prod.units <= 2
                puts "\n ***** Inventory Alert ***** \n We can only accomodate #{prod.max_stock - prod.units} more Units. \n Please do the needful to release some Inventory."
            end
        end

        if opn == "remove"
            print "Please provide number of Units to be removed from Inventory : "
            units = gets.to_i
            post_remove_units = prod.units - units

            if prod.min_stock > post_remove_units
                prod.units -= units
            else 
                puts "Oops! Minimum stock limit is getting breached. We can not release #{units}-more units! :("
            end

            if prod.units - prod.min_stock <= 2
                puts "\n ***** Inventory Alert ***** \n We have only #{prod.units} more Units of #{prod.name} in Stock. \n Please do the needful to procure some Inventory."
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

    #Method to get Product Details by Name
    def getProdbyName(name)
        prod = @@products.find { |p| p.name == name }
        if prod.nil?
            puts "Oh! Looks like there are No Products registered with Name : #{name}"
        else
            puts "Product Details for : #{name}"
            puts "\n (*) Product Name : #{prod.name}"
            puts " (*) Units in Stock : #{prod.units}"
            puts " (*) Per Unit Price : Rs. #{prod.price} INR"
            puts " (*) Minimum Stock Units : #{prod.min_stock}"
            puts " (*) Maximum Stock Units : #{prod.max_stock}"
        end
    end

    #Method to get Product Details with Highest/Lowest stocks in Inventory
    def stockRankings(stat)
        stock_count = {} #Hash to store Product Name and Stock Units
        @@products.each { |p| stock_count [p.units] = p.name } 

        if stat == "max"
            pnames = []
            stock_count.keys.sort!.last(3).each { |count| pnames << stock_count[count] }

            puts "\n Please find below Product Details for Top-3 Products with maximum units in Stock : "
            pnames.reverse.each { |pname| getProdbyName(pname) }
        elsif stat == "min"
            pnames = [] 
            stock_count.keys.sort!.first(3).each { |count| pnames << stock_count[count] }

            puts "\n Please find below Product Details for Top-3 Products with minimum units in Stock : "
            pnames.each { |pname| getProdbyName(pname) }
        end
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
            puts "\n 7. Make a Product Search."
            
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
                d.stockRankings("max")
            when 6
                d.stockRankings("min")
            when 7
                print "Please enter the Product Name to Search : "
                pname = gets.chomp

                d.getProdbyName(pname)
            else 
                puts "\n Aah.. We don't have that Option yet !"
            end

            print "\n In a mood to further continue? (y/n) : "
            loop = gets.chomp
        end
    end

end

#%x("clear") -- To clear/reset the screen 

# Method Call to start App : class method (Called without instanising the Product class)
Product.getUserActions

exit
