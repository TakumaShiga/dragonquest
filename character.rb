require "./message_dialog"

class Character
  include MessageDialog

  attr_reader :offense, :defense
  attr_accessor :name, :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end
