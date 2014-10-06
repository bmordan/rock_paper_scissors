require 'sinatra/base'
require_relative './player'
require_relative './game'

class Ronin < Sinatra::Base
  
  set    :public_folder, 'public'
  set    :views, Proc.new { File.join(root, "..", "views") } 
  enable :sessions

  GAME = Game.new

  get '/' do
    session[:game] = GAME
    GAME.waiting_gestures = []
    GAME.player1 = nil
    GAME.player2 = nil
    erb :home
  end

  get '/home' do
    @prompt = "Enter your Name"
    erb :home
  end

  get '/start' do
    redirect '/home' if params[:player] == ""
    player = Player.new(:name => params[:player], :session_id => session[:session_id])
    GAME.player1.nil? ? GAME.player1=player : GAME.player2=player
    erb :start
  end

  get '/play' do
    gesture = { player: params[:player], gesture: params[:gesture] }
    GAME.waiting_gestures << gesture unless GAME.waiting_gestures.include?(gesture)
    if GAME.waiting_gestures.count == 2
      @result = GAME.try( GAME.waiting_gestures[0][:gesture] , GAME.waiting_gestures[1][:gesture] )
      session[:session_id]==GAME.player1.session_id ? player = GAME.player1 : player = GAME.player2
      @result.split[0] == params[:gesture] && session[:session_id] == player.session_id ? @message = "Winner!" : @message = "Losser!"
    end
    erb :result
  end

  get '/play/human' do
    GAME.player2.nil? ? @player2="" : @player2=GAME.player2.name
    if GAME.player2.nil?
      @player2 == ""
    else
      GAME.player1.session_id==session[:session_id] ? @player=GAME.player1.name : @player=GAME.player2.name
      @player==GAME.player1.name ? @other_player=GAME.player2.name : @other_player=GAME.player1.name
    end
    @hash = GAME.gesture_hash
    erb :play_human
  end

  get '/play/reset' do
    GAME.waiting_gestures = []
    if GAME.player2.name == "Robot"
      redirect '/play/robot'
    else
      redirect '/play/human'
    end  
  end

  get '/play/robot' do
    GAME.player2 = Player.new({name: "Robot",session_id: "00"})
    robot_gesture = {player: "Robot", gesture: GAME.gesture_hash.keys.sample.to_s}
    GAME.waiting_gestures << robot_gesture
    @player=GAME.player1.name
    @other_player=GAME.player2.name
    @hash = GAME.gesture_hash
    erb :play_robot
  end
  
  run! if app_file == $0
end




