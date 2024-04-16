class Player
  attr_accessor :name, :life_points
  
  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    if is_a?(User)
      puts "#{@name} a #{@life_points} de vie et une arme de niveau #{@weapon_level}"
    else
      puts "#{@name} a #{@life_points} de vie"
    end
  end

  def gets_damage(damage_number)
    if @life_points <= 0 
      puts "Le joueur #{@name} a été tué !"
    else 
      @life_points -= damage_number
    end
  end

  def attacks(victim)
    puts "Le joueur #{@name} attaque le joueur #{victim.name}..." 
    damage_number = compute_damage
    victim.gets_damage(damage_number) 
    puts "Il lui a infligé #{damage_number} points de dommages..."
  end
  
  def attacks(target)
    puts "Le joueur #{@name} attaque le joueur #{target.name}"
    damage_number = compute_damage
    target.gets_damage(damage_number)
    puts "Il lui inflige #{damage_number} points de dommages"
  end

  def compute_damage
    return rand(1..6)
  end
end


class User < Player
  attr_accessor :weapon_level 

  def initialize(player_name)
    @name = player_name
    @life_points = 100
    @weapon_level = 1
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end
  
  def search_weapon
    new_weapon = compute_damage
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon 
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack 
    new_health = compute_damage
    if new_health == 1
      puts "Tu n'as rien trouvé... "
    elsif new_health > 2 && new_health < 5
      @life_points += 50
      @life_points = [@life_points, 100].min
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else new_health == 6
      @life_points += 80
      @life_points = [@life_points, 100].min
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end
