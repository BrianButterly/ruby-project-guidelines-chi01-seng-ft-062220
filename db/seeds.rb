require_relative '../config/environment'

ActiveRecord::Base.logger = nil

Game.delete_all
Player.delete_all
Review.delete_all


catan = Game.create(id: 1, name: "Catan", game_type: "Board Game")
monopoly = Game.create(id: 2, name: "Monopoly", game_type: "Board Game")
pandemic = Game.create(id: 3, name: "Pandemic", game_type: "Board Game")
dominion = Game.create(id: 4, name: "Dominion", game_type: "Board Game")
fluxx = Game.create(id: 5, name: "Fluxx", game_type: "Card Game")
go_fish = Game.create(id: 6, name: "Go Fish", game_type: "Card Game")
nuts = Game.create(id: 7, name: "Nuts!", game_type: "Card Game")
dungeons_dragons = Game.create(id: 8, name: "Dungeons and Dragons", game_type: "RPG Game")
fate = Game.create(id: 9, name: "Fate", game_type: "RPG Game")

adam = Player.create(id: 1, name: "Adam")
brittany = Player.create(id: 2, name: "Brittany")
clarence = Player.create(id: 3, name: "Clarence")
derick = Player.create(id: 4, name: "Derick")
eve = Player.create(id: 5, name: "Eve")
fatima = Player.create(id: 6, name: "Fatima")
greg = Player.create(id: 7, name: "Greg")
haley = Player.create(id: 8, name: "Haley")

review1 = Review.create(id: 1, player_id: 1, game_id: 1, player_review: "I've been playing this game for years with my friends. A classic game that's easy to teach.", rating: 9)
review2 = Review.create(id: 2, player_id: 2, game_id: 1, player_review: "Got this game as a gift from my folks. It just seems like the german version monopoly though.", rating: 3)
review3 = Review.create(id: 3, player_id: 3, game_id: 5, player_review: "A fun, fast-paced, ever changing game. Good to break out at the bar.", rating: 6)
review4 = Review.create(id: 4, player_id: 4, game_id: 4, player_review: "Best. Game. EVER.", rating: 10)
review5 = Review.create(id: 5, player_id: 8, game_id: 9, player_review: "I've only ever played D&D rpg games before, but recently my friend ran us a game with Fate Core and it was the most fun I've had in years! I bought the Fate Core set and am absolutley looking forward to running my own game.", rating: 8)
review6 = Review.create(id: 6, player_id: 7, game_id: 6, player_review: "Booooooring.", rating: 1)
review7 = Review.create(id: 7, player_id: 6, game_id: 2, player_review: "I always get into fights with my siblings over this game. Do not buy if you want your house to stay civil.", rating: 2)
review8 = Review.create(id: 8, player_id: 5, game_id: 7, player_review: "Cute and fun! The squirrels are great.", rating: 7)
review9 = Review.create(id: 9, player_id: 6, game_id: 3, player_review: "A fun co-op game.", rating: 5)
review10 = Review.create(id: 10, player_id: 8, game_id: 8, player_review: "A classic RPG titan that can never be defeated. But some of the concepts are rather stale. I wish they weren't afraid to revisit and modernize them. That being said, it was the first RPG I played with my friends and it holds a special place in my heart.", rating: 4)
review11 = Review.create(id: 11, player_id: 3, game_id: 8, player_review: "Too many rules.", rating: 2)
review12 = Review.create(id: 12, player_id: 6, game_id: 3, player_review: "If anxiety was a game it would be this. Friends love it but it gets too real for me.", rating: 3)


#binding.pry


puts "hello"