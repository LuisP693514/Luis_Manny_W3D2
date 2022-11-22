#game class
class Game
    def initialize
        @board = Board.new(4)
        @prev_position = []
    end
    def play
        while !@board.won?
            @board.render
            puts “Enter Position like 1 2”
            input = gets.chomp.split.map(&:to_i)
            make_guess(input)
            sleep(2)
            system(“clear”)
        end
    end
    def make_guess(pos)
        if @prev_position.length == 0
            @board.reveal(pos)
            @prev_position = pos
        else
            @board.grid[pos[0]][pos[1]]
        end
    end
end

