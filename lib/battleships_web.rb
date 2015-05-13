require 'battleships'
require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }
  set :session_secret, 'super secret'
  

  
  get '/' do
    
    erb :index
  end

  get '/newplayer' do
    $game = Game.new Player, Board
    erb :index2
  end

  get '/newgame' do
  $name = params[:name]
  erb :index3
  end

  post '/newgame' do
  @coords = params[:coords]
  @orientation = params[:orientation]
  $game.player_1.place_ship Ship.battleship, @coords, @orientation
  erb :index3
  end


  # get '/placeship' do
  # @coords = params[:coords]
  # @orientation = params[:orientation]
  # $game
  # erb :index4
  # end
 
  # start the server if ruby file executed directly
  run! if app_file == $0
end




