class Player < ActiveRecord::Base
    has_many :reviews
    has_many :games, through: :reviews
   
    def my_reviews
        self.reviews.map{|key| key.player_review}
    end

    def find_my_games
        self.games.map{|key| key.name}.uniq
    end

    def delete_my_games
        self.games.destroy_all
        puts "Cleared the board!"
    end

    def write_review(game, review, rate)
        x = Game.all.find{|key| key.name == game}
        y = x.id
        Review.create(player_id: self.id, game_id: y, player_review: review, rating: rate)
        puts "Added!"
    end  

    def delete_review(game)  
        x = self.games.find{|key| key.name == game}
        y = x.id
        game_review = self.reviews.find_by(game_id: y)
        game_review.destroy
        self.games = self.games.filter {|my_game| my_game.name != game}
        # self.games = self.games.reject {|game| game.name == game}
        # self.games = self.games.reject do |game|
        #     game.name == x
        # end
        # x.destroy
        # binding.pry
        puts "Removed!"
    end  
    
    def update_review(game, review, rate)
        x = self.games.find{|key| key.name == game}
        y = x.id
        updated_review = self.reviews.find_by(game_id: y)
        # updated_review.update(game_id: y, player_review: review, rating: rate)
        updated_review = Review.update(game_id: y, player_review: review, rating: rate)
        puts "Updated!"
    end    
end


