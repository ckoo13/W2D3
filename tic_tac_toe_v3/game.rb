require_relative "board"
require_relative "human_player"

class Game
    def initialize(n, *marks)
        @board = Board.new(n)
        @players = marks.map { |mark| HumanPlayer.new(mark)}
        @current_player = @players.first
    end

    def switch_turn
        @current_player = @players.rotate!
    end

    def play
        while @board.empty_positions?
            @board.print
            move = @current_player.get_position
            @board.place_mark(move, @current_player.mark)

            if @board.win?(@current_player.mark)
                return "Victory for Player #{@current_player.mark.to_s}!"
            else
                self.switch_turn
            end
        end

        p "Game has ended in a draw!"
    end 
end