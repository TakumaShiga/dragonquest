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

    attack_type = decision_attack_type

    damage = calculate_damage(target: monster, attack_type: attack_type)

    cause_damage(target: monster, damage: damage)
   
    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  private

  def decision_attack_type
    attack_num = rand(4)
    if attack_num == 0
      "special_attack"
    else
      "normal_attack"
    end
  end

  def calculate_damage(**params)
    target = params[:target]
    attack_type= params[:attack_type]
    if attack_type == "special_attack"
      calculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]
    target.hp -= damage
    puts "#{target.name}は#{damage}のダメージを受けた"
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
    if @hp <= @triger_of_transform &&      @transform_flag == false
      @transform_flag = true
      transform
    end
    
    puts "#{@name}の攻撃"
    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private

  def calculate_damage(target)
      @offense - target.defense
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]
    target.hp -= damage
    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def transform
    transform_name = "ドラゴン"
    puts <<~EOS
     #{@name}は怒っている
     #{@name}は#{transform_name}に変身した
    EOS
   @name = transform_name
   @offense * POWER_UP_RATE
  end

end

monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

loop do
  brave.attack(monster)
  monster.attack(brave)
end


