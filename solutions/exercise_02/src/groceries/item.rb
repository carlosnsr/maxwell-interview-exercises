require 'money'
Money.locale_backend = nil
Money.default_currency = 'USD'
Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN

module Groceries
  class Item
    attr_reader :name, :price

    def initialize(name, price)
      @name = name
      @price = convert_to_money(price)
    end

    def cost(quantity)
      price * quantity
    end

    def savings(quantity)
      0
    end

    def convert_to_money(money)
      return money if money.is_a?(Money)
      Money.from_amount(money)
    end
  end

  class SaleItem < Item
    attr_reader :sale

    def initialize(name, price, sale)
      super(name, price)
      @sale = sale
      @sale[:price] = convert_to_money(@sale[:price])
    end

    def cost(quantity)
      price * (quantity % sale[:quantity]) \
        + sale[:price] * (quantity / sale[:quantity])
    end

    def savings(quantity)
       cost_without_sale(quantity) - cost(quantity)
    end

    private

    def cost_without_sale(quantity)
      Item.instance_method(:cost).bind(self).call(quantity)
    end
  end
end
