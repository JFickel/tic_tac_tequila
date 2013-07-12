class Game < ActiveRecord::Base
  has_many :rounds
  has_many :player_games
  has_many :players, through: :player_games
end
