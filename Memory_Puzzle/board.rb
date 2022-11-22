
require_relative "card.rb"

class Board
    attr_reader :grid
    def initialize(num=4)
        
        @grid = Array.new(num) { Array.new(num) }

    end

    def populate
        (@grid.length / 2).times do
            values = (0..9).to_a
            random = rand(0..9)
            card_arr = []
            2.times do
                card_arr << Card.new(values[random])
            end
            while card_arr.length > 0
                @grid.each.with_index do |row, idx1|
                    row.each.with_index do |value, idx2|
                        if value == nil
                            @grid[idx1][idx2] = card_arr.pop
                        end
                    end
                end
            end
        end
    end



end


b = Board.new(4)
b.populate
print b.grid