#!/usr/bin/env ruby

# --------------------------------------------------------------------
# Message Parser Script :
#   - Reads through multiple messages (.vmg format) in a Directory
#   - Parses the Messages for Content and Timestamp
#   - Stores parsed Content in file : parsed_msgs.txt
#     in the format <Timestamp> : <msg>
#
# Usage : ./msgParser.rb <dir_path>
# 
# Author : Prashant Dasgupta (prashant.dasgupta@yahoo.com)
# --------------------------------------------------------------------

BEGIN{
    puts "\n\n ************ Message Parser *******************"
}

END{
    puts "\n\n ************ !! Thank You !! *******************"
}

def flist(path)
    cmd = "cd #{path} ; ls *.vmg > files.txt"
    `#{cmd}`
end

def parser(path)
    IO.foreach("#{path}/files.txt") { |file|
        File.open("#{path}/#{file}", "r") do |f|
            f.each_line do |line|
                puts line
            end
        end
    }
end


=begin
def parser(path)
    IO.foreach("#{path}/files.txt") { |file|
        f = file.chomp
        if File.exist?("#{f}")
            puts "Parsing file : #{f}"
            tstamp = IO.binread("#{path}/#{file}").split("\x00").join.split("\n")[13]
            msg = IO.binread("#{path}/#{file}").split("\x00").join.split("\n")[14]

            puts "#{tstamp} \n #{msg}"
        else
            puts "#{f} : File does not exist."
        end
    }
end
=end

# Storing the Directory Path in Variable
dir = ARGV[0]

# Checking if the Directory Path is Provided
if !dir
    puts "\n Please Provide message Directory Path."
else
    puts "\n Reading through the Messages in path : #{dir}"
    flist(dir)

    puts "\n Messages in #{dir} : \n"
    parser(dir)
end

