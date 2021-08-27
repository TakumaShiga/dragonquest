class Character
  attr_reader :offense, :defense
  attr_accessor :name, :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end
