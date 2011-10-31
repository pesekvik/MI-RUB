require "../lib/tennis_scorer"
describe "TennisScorer", "basic scoring" do
  it "should start with a score of 0-0" do
    ts = TennisScorer.new
    ts.score.should == "0-0"
  end
  it "should be 15-0 if the server wins a point" do
		ts = TennisScorer.new
		ts.server_point
    ts.score.should == "15-0"
	end
  it "should be 0-15 if the receiver wins a point" do
		ts = TennisScorer.new
		ts.receiver_point
    ts.score.should == "0-15"
	end
  it "should be 15-15 after they both win a point" do
		ts = TennisScorer.new
		ts.receiver_point
		ts.server_point
    ts.score.should == "15-15"
	end
	 it "should be 30-15 after they server wins 2 and receiver 1 point" do
		ts = TennisScorer.new
		ts.receiver_point
		2.times {ts.server_point}
    ts.score.should == "30-15"
	end
  # ...
end
