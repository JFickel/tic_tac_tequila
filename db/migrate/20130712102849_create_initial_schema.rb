class CreateInitialSchema < ActiveRecord::Migration
  def change
     create_table :players do |t|
      t.string :username
      t.text  :email
      t.text :password_hash
      t.text :password_salt

      t.timestamps
    end 

    create_table :games do |t|
      t.boolean :finished, :default => false
      t.string :name
      
      t.timestamps
    end

    create_table :rounds do |t|
      t.belongs_to :game
      t.string :state
      t.string :starter
      t.string :winner

      t.timestamps
    end

    create_table :player_rounds do |t|
      t.belongs_to :player
      t.belongs_to :round
    end

    create_table :player_games do |t|
      t.belongs_to :player
      t.belongs_to :game
    end
  end
end




