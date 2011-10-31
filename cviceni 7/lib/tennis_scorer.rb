class TennisScorer
  def initialize
		@scoreComp = "0";
		@scorePlayer = "0";
		
	end
	def server_point
		case @scoreComp
			when "0"
				@scoreComp = "15"
			when "15"
				@scoreComp = "30"
			when	"30" 
				@scoreComp = "40"				
			when	"40" && @scorePlayer != "40"
				@scoreComp = "45"#won
			when	"40" && @scorePlayer == "40"
				@scoreComp = "AD"
			when "AD"
				@scoreComp = "45"
		end
	end
	def receiver_point
		case @scorePlayer
			when "0"
				@scorePlayer = "15"
			when "15"
				@scorePlayer = "30"
			when	"30" 
				@scorePlayer = "40"				
			when	"40" && @scoreComp != "40"
				@scorePlayer = "45"#won
			when	"40" && @scoreComp == "40"
				@scorePlayer = "AD"
			when "AD"
				@scorePlayer = "45"
		end
	end
	def score
		return "#{@scoreComp}-#{@scorePlayer}"
	end
end

ts = TennisScorer.new
ts.server_point
  puts  ts.score