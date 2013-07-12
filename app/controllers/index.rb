get '/' do
  # Look in app/views/index.erb
  haml :index
end

get '/games/new' do
  game = Game.new
end

get '/rounds/new' do
  params[:game_id]
  round = Round.new(game_id: params[:game_id], )
end

get '/games/:id' do # what is the game's status?

end

put '/rounds/:id' do
end
