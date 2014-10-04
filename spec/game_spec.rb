require_relative '../app/game'

describe Game do
  
  let(:game) {Game.new}
  let(:player1) {double :player1}
  let(:player2) {double :player2}

  it "should hold 2 players" do
    game.player1 = player1
    expect(game.player1).to eq(player1)
  end

  it "should hold the gesture_hash" do
    expect(game.gesture_hash).to be_a(Hash)
  end

  it "should take two gestures and compair" do
    allow(game.player1).to receive(:wins=)
    expect(game.try("spock","paper")).to be_a(String)
  end

  it "should return a winner statement" do
    allow(game.player1).to receive(:wins=)
    expect(game.try("spock","paper")).to eq("paper disproves spock")
  end

  it "should load two different gestures for the try function" do
    expect(game.waiting_gestures).to be_a(Array)
  end
  
end