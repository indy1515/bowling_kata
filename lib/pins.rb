#pins.rb
# define class Pins
class Pins  
	@@MAX_PIN = 10
	@@MAX_HIT = 2
	@@hit_counter = 0
	def initialize()  
		# Instance variables
		@stand_pin = MAX_PIN   
	    @falling_pin = 0; 
	end 

	def hit(number)
		if hit < 2 
		  	if(number <= @stand_pin)
		    	total_fall = setfalling_pin(number)
		    	if(number == @@MAX_PIN)
		    		hit_counter =+ 2
		    		return "STRIKE"
		    	elsif 
		    		hit_counter =+ 1
		    		if(total_fall == 0)
		    			return "SPARE"
		    		elsif(hit_counter == 2)
		    			return "END"
		    		end
		    	end
		    else
		    	puts "Number(#{number}) more than pins(#{@stand_pin})! Try Again!"
		    end
		else
			puts "Exceed Hit Number #{@@hit_counter}"
		end
	end  

	def setfalling_pin(number)
	  	@falling_pin = @falling_pin + number
	  	@stand_pin = @stand_pin - number
	  	puts "You hit #{number} pins. Total fallen pin = #{@falling_pin}"
	  	return @falling_pin
	end

	def display
	  	puts "You have #{@stand_pin} Pins left"
	end
	# def display  
	#   puts "I am of #{@breed} breed and my name is #{@name}"  
	# end  
end  