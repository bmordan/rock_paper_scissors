class Game

  attr_accessor :players
  attr_accessor :session_id
  attr_accessor :waiting_gestures
  attr_reader   :gesture_hash

  def initialize
    @players ||= []
    @gesture_hash = {
      :rock    => [{:sissors => "crushes"},{:lizard => "crushes"}],
      :lizard  => [{:paper => "eats"},{:spock => "poisons"}],
      :spock   => [{:sissors => "smashes"},{:rock => "vaporizes"}],
      :sissors => [{:paper => "cuts"},{:lizard => "decapitates"}],
      :paper   => [{:rock => "covers"},{:spock => "disproves"}]
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
    find_a_gesture(p2, p1) if try.nil?
    return try
  end

  def find_a_gesture(win_gesture, lose_gesture)
    result = nil
    @gesture_hash[win_gesture].each do |gesture|
      result = gesture[lose_gesture] unless gesture[lose_gesture].nil?
    end
    "#{win_gesture.to_s} #{result} #{lose_gesture.to_s}" unless result.nil?
  end

  def waiting_gestures
    @waiting_gestures ||= []
  end

  def is?(player)
    player.session_id == @session_id
  end

end
