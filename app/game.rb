class Game
  attr_accessor :player1
  attr_accessor :player2
  attr_reader :gesture_hash 
  
  def initialize
    @gesture_hash = {
      :rock => [{:sissors => "crushes"},{:lizard => "crushes"}],
      :lizard => [{:paper => "eats"},{:spock => "poisons"}],
      :spock => [{:sissors => "smashes"},{:rock => "vaporizes"}],
      :sissors => [{:paper => "cuts"},{:lizard => "decapitates"}],
      :paper => [{:rock => "covers"},{:spock => "disproves"}]
    }
  end

  def try(p1_gesture,p2_gesture)
    p1_options = @gesture_hash[p1_gesture.to_sym]
    p2_options = @gesture_hash[p2_gesture.to_sym]
    p1_results = p1_options.map {|option| option.fetch(p2_gesture.to_sym, false) }
    p2_results = p2_options.map {|option| option.fetch(p1_gesture.to_sym, false) }
    p1_win = p1_results.select { |option| option != false }
    p2_win = p2_results.select { |option| option != false }
    p1_win == [] ? "#{p2_gesture} #{p2_win[0]} #{p1_gesture}" : "#{p1_gesture} #{p1_win[0]} #{p2_gesture}"
  end

end