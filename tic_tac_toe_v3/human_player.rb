require "byebug"
class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        begin
        p "Player #{mark.to_s}, enter a position with coordinates separated with a space like 'row col'"

        rowcol = gets.chomp
        row = rowcol[0].to_i
        col = rowcol[-1].to_i

        position = [row,col]
        raise "try again in the correct format" if rowcol.length != 3 || !legal_positions.include?(position)
        rescue
            
            retry
        end

        position
    end
end