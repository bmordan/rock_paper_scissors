require 'sinatra/base'

class Ronin < Sinatra::Base
  
  set :public_folder, 'public'
  set :views, Proc.new { File.join(root, "..", "views") } 

  get '/' do
    
  end

  get '/home' do
    erb :home
  end

  get '/start' do
    puts params.inspect
    player = params[:player]
    erb :start
  end

  run! if app_file == $0
end
