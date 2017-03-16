class Cell
  attr_reader :pos
  attr_accessor :val

  def initialize (args)
    @pos = args[:pos]
    @val = args[:val]
  end

  def is_open?
    val.is_a?(Integer)
  end
end
