require 'pry'
class CashRegister
    
    attr_accessor :discount, :total, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        self.last_transaction = price * quantity
        i = 0
        while i < quantity do
            @items << title
            i += 1 
        end
    end

    def apply_discount
        if self.discount > 0
            @percent_off = self.discount.to_f / 100.0
            self.total = (self.total - (self.total * @percent_off)).to_i
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end        
