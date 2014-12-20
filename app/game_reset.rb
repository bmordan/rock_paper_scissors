routes do

  get '/replay' do
    GAME.waiting_gestures = []
    if GAME.player(2)[:name] == "Robot"
      GAME.players.delete(GAME.player(2))
      redirect '/play_robot'
    else
      redirect '/play_human'
    end
  end
  
end