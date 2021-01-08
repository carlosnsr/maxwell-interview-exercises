module Groceries
  class Item
    attr_reader :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end
  end

  class SaleItem < Item
    attr_reader :sale

    def initialize(name, price, sale)
      super(name, price)
      @sale = sale
    end
  end
end
