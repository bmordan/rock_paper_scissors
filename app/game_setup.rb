routes do
  
  get '/' do
    GAME.reset
    session[:game] = GAME
    GAME.session_id = session[:session_id]
    erb :home
  end

  post '/add_player' do
    GAME.players << {name: params[:player],session: session[:session_id]}
    redirect '/select_game_mode'
  end

  get '/select_game_mode' do
    @player = GAME.players.last
    erb :game_mode
  end

  get '/waiting' do
    GAME.waiting_gestures << params unless GAME.waiting_gestures.include?(params)
    puts GAME.waiting_gestures.inspect
    if GAME.waiting_gestures.length >= 2
      redirect '/play_gesture'
    else
      erb :waiting
    end
  end

end