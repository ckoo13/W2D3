require_relative "board"
require_relative "human_player"

class Game
    def initialize(player_1_mark, player_2_mark)
        @board = Board.new
        @playerone = HumanPlayer.new(player_1_mark)
        @playertwo = HumanPlayer.new(player_2_mark)
        @current_player = @playerone
    end

    def switch_turn
        if @current_player == @playerone
            @current_player = @playertwo
        else
            @current_player = @playerone
        end
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