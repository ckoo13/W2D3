class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    def valid?(position)
        row, col = position
        if row < 0 || row > @grid.length - 1 || col < 0 || col > @grid.length - 1
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
        win_left = true
        #left diagonal method
        pointer = 0
        left_to_right = @grid.each_with_index do |row, idx|
            row.each_with_index do |ele, i|
                if pointer == i && pointer == idx && ele != mark
                    win_left = false
                end
            end

            pointer += 1
        end

        win_right = true
        #right diagonal method
        pointer_right = @grid.length - 1
        right_to_left = @grid.each do |row|
            row.each_with_index do |ele, i|
                if i == pointer_right && ele != mark
                    win_right = false
                end
            end

            pointer_right -= 1
        end

        win_left || win_right
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.any? { |ele| ele == "_"}}
    end
end

#questions
#1) after exception I can't re-enter a number without getting an error
#2) need to fix win_diagonal? method