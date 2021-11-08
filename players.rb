class Player
  attr_reader :handle
  attr_accessor :turn, :score

  def initialize(handle)
      @handle = handle
      @turn = false
      @score = 3
  end
end