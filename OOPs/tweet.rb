#!/usr/bin/env ruby

# ------------------------------
# Tweeter Class
# - Attributes and Methods
# ------------------------------


class Tweet

# @name, @tweet
# display_tweet
	
	def name=(user_name)
		@name = user_name 
	end

	def name
		@name  
	end

	def tweet=(user_msg)  #writer method 
		if user_msg.length <= 160
			@tweet = user_msg 
		else 
			puts "Tweet Length > 160 Chars"
		end

	end

	def tweet #instance method : reader method
		@tweet
	end
	
	def display_tweet
		puts "#{@tweet} \n\t -@#{@name}"
	end

end

tweet1 = Tweet.new
tweet2 = Tweet.new

tweet1.name = "P_K_D"
tweet1.tweet = "Keep Smiling! :)"
tweet1.display_tweet

puts "---------------------------------"

tweet2.name = "imsrk"
tweet2.tweet = (1..200).to_a.join
tweet2.display_tweet
