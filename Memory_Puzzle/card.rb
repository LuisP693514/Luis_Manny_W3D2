

class Card

    attr_reader :value

    def initialize(value)
        @value = value
        @face_value = false

    end

    def hide
        @face_value = false
    end

    def reveal
        @face_value = true
    end

end

# c = Card.new(4)

# c.hide #-> @face_value = face down