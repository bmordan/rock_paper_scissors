require 'sinatra/base'
require_relative './player'
require_relative './game'

class Ronin < Sinatra::Base
  
  set :public_folder, 'public'
  set :views, Proc.new { File.join(root, "..", "views") } 
  enable :sessions

  GAME = Game.new

  get '/' do
    session[:game] = GAME
    erb :home
  end

  get '/home' do
    @prompt = "Enter your Name"
    erb :home
  end

  get '/start' do
    redirect '/home' if params[:player] == ""
    player = Player.new(:name => params[:player], :session_id => session[:session_id])
    GAME.player1.nil? ? GAME.player1 = player : GAME.player2 = player
    erb :start
  end

  get '/play/human' do
    GAME.player2.nil? ? @player2 = "" : @player2 = GAME.player2.name
    if GAME.player2.nil?
      @player2 == ""
    else
      GAME.player1.session_id == session[:session_id] ? @player = GAME.player1.name : @player = GAME.player2.name
      @player == GAME.player1.name ? @other_player = GAME.player2.name : @other_player = GAME.player1.name
    end
    erb :play
  end

  run! if app_file == $0
end
