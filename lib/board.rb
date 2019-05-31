class Board
  attr_accessor :grid

  def self.default_grid
    Array.new(10) {Array.new(10, nil)}
  end

  def initialize(grid = nil)
    @grid = grid ? grid : Board.default_grid 
  end

  def [](pos)
    x, y = pos[0], pos[1]
    @grid[x][y] 
  end

  def []=(pos, val)
    x, y = pos[0], pos[1]
    @grid[x][y] = val 
    @grid
  end

  def count
    num_ships = 0
    @grid.each do |row|
      row.each do |col|
        num_ships += 1 if col == :s
      end
    end

    num_ships
  end

  def empty?(pos = nil)
    return count.zero? if !pos

    (self[pos]).nil?
  end

  def full?
    @grid.all? do |row|
      row.all? {|col| !!col }
    end
  end

  def place_random_ship
    raise "Board is full" if full?

    x_rand = rand(@grid.length)
    y_rand = rand(@grid[0].length)
    self[[x_rand, y_rand]] = :s
  end

  def won?
    @grid.all? do |row|
      row.all? {|col| col != :s}
    end
  end
end
