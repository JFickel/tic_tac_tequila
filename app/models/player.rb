class Player < ActiveRecord::Base
  validates_uniqueness_of :email
  
  has_many :rounds
  has_many :games, :through => :rounds 
  has_many :player_games
  has_many :players, through: :player_games

  def self.authenticate(email, password)
    current_player = self.find_by_email(email)
    nil if current_player == nil
    current_player if current_player.password_hash == BCrypt::Engine.hash_secret(password, current_player.password_salt)
  end
end
