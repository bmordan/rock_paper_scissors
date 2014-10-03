require 'sinatra/base'

class Ronin < Sinatra::Base
  
  set :public_folder, 'public'
  set :views, Proc.new { File.join(root, "..", "views") } 

  get '/' do
    erb :home
  end

  get '/home' do
    @prompt = "Enter your Name"
    erb :home
  end

  get '/start' do
    redirect '/home' if params[:player] == ""
    @player = params[:player]
    erb :start
  end

  get '/play/human' do
    erb :play
  end

  run! if app_file == $0
end
