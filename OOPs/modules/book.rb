class Book < Product

    attr_accessor :author, :pages

    def initialize(name, price, author, pages)
        super(name, price)
        @author = author
        @pages = pages
    end 

    def details
        super + "- #{author} - #{pages}"
    end

end

