module Groceries
  class ItemBuilder
    def price(value)
      @price = value
    end

    def build(name)
      Item.new(name.to_s.capitalize, @price)
    end
  end
end
