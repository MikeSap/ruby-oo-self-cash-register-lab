require 'pry'

class CashRegister

    attr_accessor :total, :discount, :prev_total, :items 

    def initialize(discount=0)
        @total = 0.0
        @discount = discount
        @items = []
    end

    def add_item(item,price,amt=1)    
        if amt > 1
            i = 0
            while i<amt
                @items << item
                i+=1
            end
        else
            @items << item
        end   
        @total += price*amt
        @prev_total =  price*amt      
        @total   
    end

    def apply_discount
        if @discount > 0
        @discount =  @discount/100.0
        @total = @total - (@total * @discount)
        
        "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @prev_total
    end

end