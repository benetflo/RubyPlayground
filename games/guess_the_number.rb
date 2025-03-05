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
    
	begin
		lower = gets.chomp.to_i

		loop do
			puts "Please input the higher value: "
			higher = gets.chomp.to_i
			if higher > lower
				return lower, higher
			else
				puts "You need to enter a higher number than #{lower}!"
			end
		end

	rescue StandardError => e
		puts "Error: #{e.message}"
		retry
	end
end

def guess_the_number

	
#	floor_value = 0
#	ceiling_value = 100
#	pc_number = rand(floor_value..ceiling_value)
	player_guess = nil
	
	puts "Welcome to guess the number!"
	puts "Default range is set to 0-100 do you wish to change it (y/n)?"
	if not start_game
		floor_value, ceiling_value = change_number_range
	else
		floor_value = 0
		ceiling_value = 100
	end

	pc_number = rand(floor_value..ceiling_value)

	puts "====|Guess the number!|===="
	
	loop do
		begin
			player_guess = gets.chomp.to_i
			if player_guess > pc_number
				puts "Lower!"
			elsif player_guess < pc_number
				puts "Higher!"
			else
				puts "You found the number!"
				break
			end
		rescue => e
			puts "Invalid input! {e}"
		end
	end
end

def main

	loop do
		guess_the_number
		puts "Play again? (y/n)"
		loop do
			answ = gets.chomp.downcase
			if answ == 'y'
				break
			elsif answ == 'n'
				exit
			else
				puts "Invalid input!"
			end
		end
	end
end

main
