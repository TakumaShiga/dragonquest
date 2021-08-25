class Brave

  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]

end

monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)



puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT

brave.hp -= 30

puts "#{brave.name}はダメージを受けた! 残りのHPは#{brave.hp}だ"
