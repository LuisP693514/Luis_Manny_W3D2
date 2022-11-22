
require_relative 'card'

class Board
    attr_reader :grid

    
    def initialize(num)

        @grid = Array.new(num) { Array.new(num) }
        populate
        @grid.each {|row| row.shuffle!}
        @grid.shuffle!
    end

    def populate
        (@grid.length**2/2).times do 
            values = (0..9).to_a
            random = rand(0..9)
            card_arr = []
            2.times {card_arr << Card.new(values[random]) }
                
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

    # iterate through each val in grid. check to see if val is face up
    # print out val if its face up if not print out empty space
    def render
        @grid.each do |row|

            row.each do |card|
                print ""

                if !card.face_value?
                    print " "
                else
                    print card.value.to_s
                end
            end
            print "\n"
        end
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        card = @grid[row][col]
        if !card.face_value?
            card.reveal
            return card.face_value?
        end
    end

    def won?
        @grid.flatten.all? { |cards| cards.face_value? }
    end

end



