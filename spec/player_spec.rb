require_relative '../app/player'

describe Player do
  let(:player) {Player.new(name: "Player1",session_id: "1234")}

  it "should have a default name of Player1" do
    expect(player.name).to eq("Player1") 
  end

  it "can have a name set on init" do
    ron = Player.new(name: "Ron",session_id: "1234")
    expect(ron.name).to eq("Ron")
  end

  it "can have a browser session_id added" do
    expect(player.session_id).to eq("1234")
  end

  it "will error if the player has no session_id" do
    expect( lambda {Player.new(name: "Ron")} ).to raise_error(RuntimeError)
  end
end