
choices = ["ROCK", "PAPER", "SCISSORS"]

player_score = 0
pc_score = 0
score_limit = 0

def print_questions(choices)
    puts "Choose: #{choices.join(', ')}?"
end

def check_win(user_choice, pc_choice, player_score, pc_score)

    if (user_choice == "ROCK" && pc_choice == "PAPER") || 
        (user_choice == "PAPER" && pc_choice == "SCISSORS") || 
        (user_choice == "SCISSORS" && pc_choice == "ROCK")
        
        puts "You lost!"
        pc_score += 1
        
    elsif (user_choice == "ROCK" && pc_choice == "SCISSORS") ||
        (user_choice == "PAPER" && pc_choice == "ROCK") ||
        (user_choice == "SCISSORS" && pc_choice == "PAPER")

        puts "You won!"
        player_score += 1
    else
        puts "It's a tie!"
    end
        
    return player_score, pc_score
end

def show_score(player_score, pc_score)
    puts "Player score: #{player_score}"
    puts "PC score: #{pc_score}"
end

def choose_score_limit
    
    limit = 0
    puts "Choose a score limit between 1-5"
    until (1..5).include?(limit)
        limit = gets.to_i
        if !((1..5).include?(limit))
        puts "Input given was not within given limits"
        end
    end
    limit
end

def new_game()
    loop do
        puts "Play again? (Y/N)"
        answ = gets.chomp.upcase
        case answ
        when "Y"
            return true
        when "N"
            return false
        else
            puts "Please choose 'Y' for 'yes' or 'N' for 'No'"
        end
    end
end


#MAIN LOOP

loop do
    score_limit = choose_score_limit()
    while player_score < score_limit && pc_score < score_limit
        print_questions(choices)
        
        pc_choice = choices.sample
        user_choice = gets.chomp.upcase
        
        if !choices.include?(user_choice)
            puts "Not a valid choice!"
        else
            player_score, pc_score = check_win(user_choice, pc_choice, player_score, pc_score)
            show_score(player_score, pc_score)
        end
    end

    
    if !new_game()
        break
    else
        player_score = 0
        pc_score = 0
    end
end   







