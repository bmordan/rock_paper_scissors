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
    GAME.session_id = session[:session_id]
    GAME.waiting_gestures = []
    erb :home
  end

  get '/home' do
    @prompt = "Enter your Name"
    erb :home
  end

  get '/start' do
    redirect '/home' if params[:player] == ""
    player = Player.new(
      :name => params[:player],
      :session_id => session[:session_id]
    )
    GAME.players << player
    erb :start
  end

  get '/play' do
    gesture = { player: params[:player], gesture: params[:gesture] }
    GAME.waiting_gestures << gesture unless GAME.waiting_gestures.include?(gesture)
    @message = GAME.try(
      GAME.waiting_gestures[0][:gesture],
      GAME.waiting_gestures[1][:gesture]
    )
    puts "/play"
    @message = "refresh" if @message.nil?
    puts @message
    erb :result
  end

  get '/play/human' do
    # GAME.player2.nil? ? @player2="" : @player2=GAME.player2.name
    # if GAME.player2.nil?
    #   @player2 == ""
    # else
    #   GAME.player1.session_id==session[:session_id] ? @player=GAME.player1.name : @player=GAME.player2.name
    #   @player==GAME.player1.name ? @other_player=GAME.player2.name : @other_player=GAME.player1.name
    # end
    # @hash = GAME.gesture_hash
    # erb :play_human
  end

  get '/play/robot' do
    GAME.players << Player.new(
      :name => "Robot",
      :session_id => "0"
    )
    GAME.waiting_gestures << {
      player: "Robot",
      gesture: GAME.gesture_hash.keys.sample.to_s
    }
    @player=GAME.player(1).name
    @other_player=GAME.player(2).name
    @hash = GAME.gesture_hash
    erb :play_robot
  end

  get '/play/reset' do
    GAME.waiting_gestures = []
    if GAME.player(2).name == "Robot"
      GAME.players.delete(GAME.player(2))
      redirect '/play/robot'
    else
      redirect '/play/human'
    end
  end



  run! if app_file == $0
end
