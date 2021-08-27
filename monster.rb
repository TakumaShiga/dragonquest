require "./character"

class Monster < Character
  
  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
   super(
     name: params[:name],
     hp: params[:hp],
     offense: params[:offense],
     defense: params[:defense]
   )
   
    @transform_flag = false
    @triger_of_transform = params[:hp]*CALC_HALF_HP
  end

  def attack(brave)
    if @hp <= @triger_of_transform &&      @transform_flag == false
      @transform_flag = true
      transform
    end
    
    # puts "#{@name}の攻撃"
    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)
    attack_message
    damage_message(target: brave, damage: damage)
  end

  private

  def calculate_damage(target)
      @offense - target.defense
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]
    target.hp -= damage
    target.hp = 0 if target.hp < 0
    # puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def transform
    transform_name = "ドラゴン"
    # puts <<~EOS
     #{@name}は怒っている
     #{@name}は#{transform_name}に変身した
    # EOS
   @name = transform_name
   @offense * POWER_UP_RATE
  end

end


