require_relative "board"

class ComputerPlayer
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        move = legal_positions.sample
        puts "#{@mark.to_s} chooses to move at #{move.to_s}"
        move
    end 
end