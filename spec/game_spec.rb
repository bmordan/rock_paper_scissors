require_relative '../app/game'

describe Game do
  
  let(:game) {Game.new}
  let(:player1) {double :player1}

  it "should hold 2 players" do
    game.player1 = player1
    expect(game.player1).to eq(player1)
  end
  
end