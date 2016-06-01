class Mobile < Product

    attr_accessor :model, :make

    def initialize(name, price, model, make)
        super(name, price)
        @model = model
        @make = make
    end

    def details
        super + "- #{model} - #{make}"
    end

end

