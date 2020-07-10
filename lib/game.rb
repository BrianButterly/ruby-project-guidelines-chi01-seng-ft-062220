class Game < ActiveRecord::Base
    has_many :reviews
    has_many :players, through: :reviews

    def self.list_by_type(type)
        self.all.select do |game|
            game.game_type == type
        end
    end
            
    def self.random_game
        self.all.sample
    end

    def self.list_of_all_games
        self.all.map do |key|
            key.name
        end    
    end    
end