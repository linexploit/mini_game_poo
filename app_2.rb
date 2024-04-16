require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

RED = "\e[31m"
GREEN = "\e[32m"
YELLOW = "\e[33m"
BLUE = "\e[34m"
MAGENTA = "\e[35m"
CYAN = "\e[36m"
WHITE = "\e[37m"

puts "#{YELLOW}
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------
"

puts "#{YELLOW}Let's go ! Quel est ton prénom ?"
human_name = gets.chomp
human_player = User.new(human_name)
players = []
players << human_player

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = []
enemies << player1
enemies << player2


puts "\n"


puts <<-ASCII #{MAGENTA}
            \\                                           ___/________
       ___   )                    ,  @                    /    \\  \\
    @___, \\ /                  @__\\  /\\              @___/      \\@/
   /\\__,   |                  /\\_, \\/ /             /\\__/        |
  / \\    / @\\                / \\   (               / \\ /        / \\
_/__|___/___/_______________/__|____\\_____________/__/__________|__\\__
ASCII

puts "\n"


while players[0].life_points >0 && (enemies[0].life_points > 0 || enemies[1].life_points >0)
  players[0].show_state
  puts "\n"

  loop do
    puts "\n#{BLUE}Quelle action veux-tu effectuer ?"
    puts "#{BLUE}0 - chercher une meilleure arme"
    puts "#{BLUE}1 - chercher à se soigner"
    puts "\n#{BLUE}Attaquer un joueur en vue :"
    puts "#{BLUE}2 - Josiane a #{enemies[0].life_points} points de vie"
    puts "#{BLUE}3 - José a #{enemies[1].life_points} points de vie"
    puts "\n#{BLUE}Que voulez vous faire ?"
    
    choice = gets.to_i
  
    case choice
    when 0
      players[0].search_weapon
    when 1
      players[0].search_health_pack
    when 2 
      players[0].attacks(enemies[0])
    when 3
      players[0].attacks(enemies[1])
    else
      break
    end

    puts "\n"
  
    puts "#{GREEN}Les autres joueurs t'attaquent !"
    enemies.each do |player|
      player.attacks(players[0]) if player.life_points > 0
      puts "#{human_player.name} a #{human_player.life_points} points de vie restants"
      puts "\n"
    end

  end
  puts "\n"
end

puts "#{YELLOW}La partie est finie"
puts "\n"
if human_player.life_points > 0
puts "#{YELLOW}BRAVO ! TU AS GAGNE !"
else
  puts "#{YELLOW}Loser ! Tu as perdu !"
end
