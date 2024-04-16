require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "\n"

puts <<-ASCII
            \\                                           ___/________
       ___   )                    ,  @                    /    \\  \\
    @___, \\ /                  @__\\  /\\              @___/      \\@/
   /\\__,   |                  /\\_, \\/ /             /\\__/        |
  / \\    / @\\                / \\   (               / \\ /        / \\
_/__|___/___/_______________/__|____\\_____________/__/__________|__\\__
ASCII

puts "\n"

puts "À ma droite #{player1.name}"
puts "À ma gauche #{player2.name}\n\n"


puts "\n"


while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de nos joueurs :"
    player1.show_state
    player2.show_state
    puts "\n"

    puts "Passons à la phase d'attaque : "
    player1.attacks(player2)
    if player2.life_points > 0
        player2.attacks(player1)
    else 
        puts "#{player2.name} a perdu"
    end
    
    if player1.life_points <= 0
        puts "#{player1.name} a perdu"
    end
    puts "\n"
end