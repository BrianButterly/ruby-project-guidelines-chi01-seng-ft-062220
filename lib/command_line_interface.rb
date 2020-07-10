require_relative '../config/environment'
$prompt = TTY::Prompt.new
$font = TTY::Font.new(:doom)
$pastel = Pastel.new

def game_intro
   puts $pastel.green($font.write("Welcome to")) 
   puts $pastel.blue($font.write("House Rules"))
   sleep 2
end

def player_info
    answer = $prompt.select("Are You a:", %w(current_player new_player))
        case
            when answer == "current_player"
                puts "What is Your Name?"
                print ">"
                name = gets.chomp
                $player = Player.all.find {|player| player.name == name}
                puts "Hey #{$player.name} nice to see you again!"
                sleep 1
            when answer == "new_player"
                puts "What is your name?"
                print ">"
                name = gets.chomp
                $player = Player.create(name: name)
                puts "Hello #{$player.name} thank you for joining us!"
                sleep 1
        end            
end    

def main_menu
        answer = $prompt.select("How Can I Help You?", %w(reviews games 
        suprise_me! exit))
        case
        when answer == "reviews"
            print ">"
            review_menu
        when answer == "games"
            print ">"
            game_menu
        when answer == "suprise_me!"
            print ">"
            puts Game.random_game.name
            sleep 1
            whats_next
        when answer == "exit"
            puts $pastel.green($font.write("Thanks!"))
            puts $pastel.blue($font.write("Please come again!"))
            sleep 3
        end            
end

def review_menu
    answer = $prompt.select("Do You Want To:", %w(write_review my_review delete_review update_review main_menu))
    case 
        when answer == "write_review"
            puts "What Is The Game?"
            print ">"
            game = gets.chomp
            puts "What Is The Review?"
            print ">"
            review = gets.chomp
            puts "What Is The Rating?"
            puts "On A Scale of 1 to 10. 1 Being The Worst and 10 Being the Best"
            rate = gets.chomp
            print ">"
            $player.write_review(game, review, rate)
            sleep 2
            whats_next
        when answer == "my_review"
            print ">"
            puts $player.my_reviews
            sleep 2
            whats_next    
        when answer == "delete_review"
            puts "What Game Review Would You Like To Delete?"
            print ">"
            game = gets.chomp
            $player.delete_review(game)
            sleep 1
            whats_next
        when answer == "update_review"
            puts "What Review Would You Like To Update?"
            print ">"
            game = gets.chomp
            puts "What Is The New Review?"
            print ">"
            review = gets.chomp
            puts "What Is The Rating?"
            puts "On A Scale of 1 to 10. 1 Being The Worst and 10 Being the Best"
            rate = gets.chomp
            print ">"
            $player.update_review(game, review, rate)
            sleep 1
            whats_next
        when answer == "main_menu"
            main_menu    
    end            
end

def game_menu
    answer = $prompt.select("Do You Want To:", %w(top_game game_by_type all_of_the_games my_games delete_all_my_games main_menu))
    case 
        when answer == "top_game"
            print ">"
            puts Review.top_rated_game
            sleep 2
            whats_next      
        when answer == "game_by_type"
            puts "What Type of Game Would You Like?"
            puts "(ex: Card Game, Board Game, RPG Game"
            puts ">"
            type = gets.chomp
            puts Game.list_by_type(type).map{|key| key.name}
            sleep 2
            whats_next
        when answer == "all_of_the_games"
            puts Game.list_of_all_games
            sleep 2
            whats_next 
        when answer == "my_games"
            print ">"
            puts $player.find_my_games
            sleep 2
            whats_next
        when answer == "delete_all_my_games" 
            print ">"
            $player.delete_my_games
            sleep 2
            whats_next    
        when answer == "main_menu"
            main_menu    
    end
end   

def whats_next
    answer = $prompt.select("Do you want to:", %w(main_menu exit))
    case 
        when answer == "main_menu"
            puts ">"
            main_menu
        when answer == "exit"
            puts $pastel.green($font.write("Thanks!"))
            puts $pastel.blue($font.write("Please come again!"))
            sleep 3
    end        
end    

# def credits
#     "creators: Haley Ferro and Eve Reichmann"
#     "Mod 1 Flatiron Ruby Project"
#     "Thanks All!"
# end     