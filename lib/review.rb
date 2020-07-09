class Review < ActiveRecord::Base
    belongs_to :player
    belongs_to :game

    def self.top_rated_game
        its_me = self.all.sort_by { |r| r[:rating] }.reverse!.first
        its_me.game_id 
        who_am_i = Game.all.find {|key| key.id == its_me.game_id}
        who_am_i.name
    end   

    def self.top_three_games
        self.all.sort_by {|r| r[:rating]}.reverse!.first(3)
    end

    def self.best_to_worst
        list = self.all.sort_by{|r| r[:rating]}.reverse!
        id_list = list.map {|key| key.game_id}
    end     
end    