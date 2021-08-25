class Brave

  attr_reader :name, :offense, :defense
  attr_accessor :hp

  SPECIAL_ATTACK_CONSTANT = 1.5
  
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    puts "#{@name}の攻撃"
    attack_num = rand(4)

    if attack_num == 0
      puts "必殺攻撃"
      damage = calculate_special_attack - monster.defense
    else
      puts "通常攻撃"
      damage = @offense - monster.defense
    end

    monster.hp -= damage

    puts "#{monster.name}は#{damage}のダメージを受けた"
    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

end

class Monster
  attr_reader :offense, :defense
  attr_accessor :name,:hp

  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    @transform_flag = false
    @triger_of_transform = params[:hp]*CALC_HALF_HP
  end

  def attack(brave)

    if @hp <= @triger_of_transform && @transform_flag == false
      @transform_flag = true
      tranform
    end
      puts "#{@name}の攻撃"

      damage = @offense - brave.defense
      brave.hp -= damage
    
    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private

  def transform
    transform_name = "ドラゴン"
    puts <<~EOS
     #{@name}は怒っている
     #{@name}は#{transform_name}に変身した
    EOS
   @offense *= POWER_UP_RATE 
   @name = transform_name
  end

end

monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

brave.attack(monster)
monster.attack(brave)


