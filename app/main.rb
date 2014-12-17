require 'sinatra/base'
require_relative './player'
require_relative './game'

class RockPaperScissors < Sinatra::Base

  set    :public_folder, 'public'
  set    :views, Proc.new { File.join(root, "..", "views") }
  enable :sessions

  GAME = Game.new

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

  get '/replay' do
    GAME.waiting_gestures = []
    if GAME.player(2)[:name] == "Robot"
      GAME.players.delete(GAME.player(2))
      redirect '/play_robot'
    else
      puts "move to human logic"
    end
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

  run! if app_file == $0
end
