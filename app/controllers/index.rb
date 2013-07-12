get '/' do
  # Look in app/views/index.erb
  haml :index
end

get '/games/new' do
  game = Game.new
end

get '/rounds/new' do
  round = Round.new(game_id: params[:game_id])
  round.starter = [params[:player1_id], params[:player2_id]].sample
  player1_round = PlayerRound.create(round_id: round.id, player_id: params[:player1_id]) 
  player2_round = PlayerRound.create(round_id: round.id, player_id: params[:player2_id]) 
  round.state = (1..9).each.with_object({}) {|i,obj| obj[i] = nil }
  if round.save
    redirect '/games/' + round.id
  else
    redirect '/games/' + round.game_id
  end
end

get '/rounds/:id' do # what is the game's status?
  round = Round.find_by_id(params[:id])
  round.status.to_json
end

put '/rounds/:id' do
  round = Round.find_by_id(params[:id])
  round.update_attributes(params[:state])
end
