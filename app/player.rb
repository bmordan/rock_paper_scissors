class Player

  attr_reader :name
  attr_reader :session_id
  attr_accessor :wins

  def initialize(options = {})
    @name = options.fetch(:name, "Player1")
    @session_id = options.fetch(:session_id, nil)
    raise "can't add player without session_id" if @session_id.nil?
    @wins = false
  end

end