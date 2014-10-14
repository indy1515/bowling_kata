require_relative "frame.rb"
#game
class Game
	def initialize()
		@current_frame = 1;
		@frames = Array.new
		for i in 1..10
			# puts "Total Frames #{@frames.length} #{i}"
			@frames.push(Frame.new())
		end
		# puts "Total Frames #{@frames.length} #{i}"
	end

	def roll(pins)
		# puts "Current Frame: #{@current_frame}"
		if(@current_frame > 10)
			puts "Game already ended"
			return
		elsif(@current_frame == 10)
			# last frame don't contain bonuses!
			@frames[@current_frame-1].tenthFrameActivate()
			
		end
		## .hit will auto added bonus and points so... Yeah!
		state = @frames[@current_frame-1].hit(pins)
		
		## loop to add all possible bonus
		for i in 1...@current_frame
			## .addBonusScore will check the bonus slot already no need
			@frames[i-1].addBonusScore(pins);
		end
		# puts "Game state: #{state}"
		if("STRIKE" == state)
			# strike
			if(@current_frame == 10)
				@frames[@current_frame-1].resetPin()
			else
				@current_frame += 1
			end
		elsif ("SPARE" == state)
			# spare
			if(@current_frame == 10)
				@frames[@current_frame-1].resetPin()
			else
				@current_frame += 1
			end
		elsif("END" == state)
			# end of frame
			@current_frame += 1
		elsif("NORMAL" == state)
			#normal
		else
			puts "Unknown State"
		end

		if(@current_frame > 10)
			puts "End of Game"
			return
		end
		return state
		
	end

	def score()
		total_score = 0
		i = 1
		@frames.each do |frame|
			total_score += frame.getScore()
			# puts "Frame #{i} score: #{frame.getScore()}" 
			i += 1
		end
		return total_score
	end
	
end