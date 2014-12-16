require_relative '../app/game'

describe Game do

  let(:game) {Game.new}
  let(:player1) {double :player1}
  let(:player2) {double :player2, name: "player2", session: "0"}

  it "should hold players" do
    game.players << player1
    expect(game.player(1)).to eq(player1)
  end

  it "should hold the gesture_hash" do
    expect(game.gesture_hash).to be_a(Hash)
  end

  it "can take a gesture and find it in the hash" do
    expect(game.find_a_gesture(:paper,:spock)).to eq("paper disproves spock")
  end

  it "but only if the winning gesture is passed in first" do
    expect(game.find_a_gesture(:spock,:paper)).to eq("lose")
  end

  it "you get back a string statement" do
    expect(game.try("spock","paper")).to eq("paper disproves spock")
  end

  it "there is somewhere to store a waiting gesture" do
    expect(game.waiting_gestures).to be_a(Array)
  end

  it "should deal with a draw" do
    expect(game.try("paper","paper")).to eq("Draw")
  end

  it "can reset it self" do
    game.waiting_gestures << {}
    game.players << {}
    game.reset
    expect(game.players.length).to eq(0)
    expect(game.waiting_gestures.length).to eq(0)
  end

end
