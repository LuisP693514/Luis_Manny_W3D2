#game class

require_relative 'card'
require_relative 'board'

class Game
    def initialize
        @board = Board.new(4)
        @prev_position = []
    end
    def play
        while !@board.won?
            @board.render
            puts "Enter Position like 1 2"
            input = gets.chomp.split.map(&:to_i)
            make_guess(input)
        end
    end
    def make_guess(pos)
        if @prev_position.length == 0
            @board.reveal(pos)
            @prev_position = pos
        else

            current_card = @board.grid[pos[0]][pos[1]]
            prev_card = @board.grid[@prev_position[0]][@prev_position[1]]

            if current_card.value == prev_card.value
                current_card.reveal
                @prev_position = []
            else
                current_card.hide
                prev_card.hide
                @prev_position = []

            end
        end
    end
end

g = Game.new
g.play
