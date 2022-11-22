

class Card

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

c = Card.new

c.hide #-> @face_value = face down