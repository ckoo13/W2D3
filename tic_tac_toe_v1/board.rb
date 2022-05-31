class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position)
        row, col = position
        if row < 0 || row > 2 || col < 0 || col > 2
            return false
        else
            return true
        end
    end

    def empty?(position)
        row, col = position

        if @grid[row][col] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        row, col = position
        if !self.valid?(position) || !self.empty?(position)
            raise "You can't place there"
        else
            @grid[row][col] = mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        
    end
end