class Game

  attr_accessor :players
  attr_accessor :session_id
  attr_accessor :waiting_gestures
  attr_reader   :gesture_hash

  def initialize
    @players ||= []
    @waiting_gestures ||= []
    @gesture_hash = {
      :rock     => [{:scissors => "crushes"},{:lizard => "crushes"}],
      :lizard   => [{:paper => "eats"},{:spock => "poisons"}],
      :spock    => [{:scissors => "smashes"},{:rock => "vaporizes"}],
      :scissors => [{:paper => "cuts"},{:lizard => "decapitates"}],
      :paper    => [{:rock => "covers"},{:spock => "disproves"}]
    }
  end

  def player(playerNumber)
    @players[playerNumber-1]
  end

  def try(p1_gesture, p2_gesture)
    p1 = p1_gesture.to_sym
    p2 = p2_gesture.to_sym
    return "Draw" if p1 == p2
    try = find_a_gesture(p1, p2)
    try == "lose" ? find_a_gesture(p2, p1) : try
  end

  def find_a_gesture(win_gesture, lose_gesture)
    result = nil
    @gesture_hash[win_gesture].each do |gesture|
      result = gesture[lose_gesture] unless gesture[lose_gesture].nil?
    end
    result.nil? ? "lose" : "#{win_gesture.to_s} #{result} #{lose_gesture.to_s}"
  end

  def is?(player)
    player.session_id == @session_id
  end

  def reset
    @waiting_gestures = []
    @players = []
  end

end
