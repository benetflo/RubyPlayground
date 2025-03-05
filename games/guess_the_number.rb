# GUESS THE NUMBER GAME

def start_game

	loop do
		answ = gets.chomp.downcase
		
		case answ
		when 'n'
			return true
		when 'y'
			return false
		else
			puts "Invalid input! Type 'n' to start the game or 'y' to change number range."
		end
	end
end

def change_number_range
	
	puts "Please input the lower value: "
	lower = gets.chomp.to_i
	
	loop do
		puts "Please input the higher value: "
		higher = gets.chomp.to_i
		if higher > lower
			break
		else
			puts "You need to enter a higher number than #{lower}!"
		end
	end
	
	return lower, higher
end

def guess_the_number

	player_guess = nil
	floor_value = 0
	ceiling_value = 100

	puts "Welcome to guess the number!"
	puts "Default range is set to 0-100 do you wish to change it (y/n)?"
	if not start_game
		floor_value, ceiling_value = change_number_range
	else 	
		puts "william"
	end
end

guess_the_number
