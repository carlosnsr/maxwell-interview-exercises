module Groceries
  class ItemBuilder
    def initialize(name)
      @name = name.to_s.capitalize
      @sale = nil
    end

    def price(value)
      @price = value
    end

    def sale(quantity, options)
      @sale = { quantity: quantity, for: options[:for] }
    end

    def build
      raise "No price set for #{name}" if @price.nil? # don't want things to be free!
      return Item.new(@name, @price) if @sale.nil?
      SaleItem.new(@name, @price, @sale)
    end
  end
end
