require 'sinatra/base'
require 'sinatra/routes'
require_relative './player'
require_relative './game'

GAME = Game.new

class RockPaperScissors < Sinatra::Base

  set    :public_folder, 'public'
  set    :views, Proc.new { File.join(root, "..", "views") }
  enable :sessions

  register Sinatra::Routes

  run! if app_file == $0

end

require_relative './game_setup'
require_relative './game_play'
require_relative './game_reset'



