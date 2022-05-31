class Board
  def initialize(n)
    rows = n
    columns = n
    @grid = Array.new(rows){Array.new(n, :N)}
    @size = n * n
  end

  def size
    @size
  end

  def [](position)
    rows, cols = position
    @grid[rows][cols]
  end

  def []=(position, value)
    rows, cols = position
    @grid[rows][cols] = value
  end   

  def num_ships
    @grid.flatten.count { |el| el == :S}
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      p "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    total_ships = 0.25 * @size
    
    while self.num_ships < total_ships
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      position = [rand_row, rand_col]
      self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          ele = :N
        else
          ele = ele
        end
      end
    end
  end

  def self.print_grid(array)
    array.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
