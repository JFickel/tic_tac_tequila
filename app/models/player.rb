class Player < ActiveRecord::Base
  validates_uniqueness_of :email
  
  has_many :player_rounds
  has_many :rounds, through: :player_rounds
  
end
