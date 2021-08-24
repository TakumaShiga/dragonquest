class Brave

  def initialize
    @name = "テリー"
    @hp = 500
    @offense = 150
    @defense = 100
  end

  def name
    @name
  end

  def hp
    @hp
  end

  def offense
    @offense 
  end

  def defense 
    @defense
  end

end

brave = Brave.new


puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT

