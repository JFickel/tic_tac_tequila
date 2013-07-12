class Round < ActiveRecord::Base
  has_many :player_rounds
  has_many :players, through: :player_rounds
  belongs_to :game

  validates_uniqueness_of :game_id, :scope => :player_id
end
