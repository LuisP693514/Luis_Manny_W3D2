

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

    def face_value?
        @face_value
    end

end