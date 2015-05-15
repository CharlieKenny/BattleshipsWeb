require 'battleships'
require 'sinatra/base'
require 'byebug'

class BattleshipsWeb < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }
  
  @@game = Game.new Player, Board
  @game = @@game
  
  get '/' do
    @game
    erb :homepage
  end

  get '/newplayer' do
    erb :index2
  end

  get '/newgame' do
    @game
    @name = params[:name]
    # @name2 = params[:name2]
    @board = @game.own_board_view @game.player_1
    erb :index3
  end

  post '/newgame' do
    @coords = params[:coords]
    @orientation = params[:orientation].downcase
    game.player_1.place_ship Ship.battleship, @coords, @orientation
    @board = game.own_board_view game.player_1
    erb :index3
  end

 
  # start the server if ruby file executed directly
  run! if app_file == $0
end


