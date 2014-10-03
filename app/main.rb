require 'sinatra/base'

class Ronin < Sinatra::Base
  
  set :public_folder, 'public'
  set :views, Proc.new { File.join(root, "..", "views") } 

  get '/' do
    'Hello Ronin!'
  end

  run! if app_file == $0
end
