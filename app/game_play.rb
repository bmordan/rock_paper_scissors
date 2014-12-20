routes do

  get '/play_robot' do
    GAME.players << {name: "Robot", session: "0"}
    GAME.waiting_gestures << {"player" => "Robot", "gesture" => GAME.gesture_hash.keys.sample.to_s}
    @player = GAME.player(1)[:name]
    @hash   = GAME.gesture_hash
    erb :play_robot
  end

  get '/play_human' do
    if GAME.players.length == 2
      @player = GAME.players.select {|player| player[:session] == session[:session_id]}
      @hash = GAME.gesture_hash
      erb :play_human
    else
      erb :waiting
    end
  end

  get '/play_gesture' do
    GAME.waiting_gestures << params unless GAME.waiting_gestures.include?(params)
    @result = GAME.try(
      GAME.waiting_gestures[0]['gesture'],
      GAME.waiting_gestures[1]['gesture']
    )
    @winner = GAME.waiting_gestures.select {|player| player['gesture'] == @result.split(' ').first}
    erb :result
  end
  
end