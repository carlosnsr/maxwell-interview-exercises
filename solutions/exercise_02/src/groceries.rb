require 'docile'
require './src/groceries/item'
require './src/groceries/item_builder'

module Groceries
  @price_list = {}

  def self.price_list
    @price_list
  end

  def self.reset_price_list
    @price_list = {}
  end

  def self.parse(input)
    Hash.new(0).tap do |list|
      input.split(',').each { |item| list[item.strip.to_sym] += 1 }
    end
  end

  FORMAT_STRING = '%-10s %-10s %-10s'
  FORMAT_STRING_LENGTH = 32

  def self.checkout(groceries)
    puts
    puts (FORMAT_STRING % %w[Item Quantity Price]).strip
    puts '-' * FORMAT_STRING_LENGTH

    savings = 0
    total_price = 0
    groceries.each do |name, quantity|
      item = @price_list[name]
      raise "Item #{name} is not in the price list" if item.nil?

      cost = item.cost(quantity)
      puts (FORMAT_STRING % [item.name, quantity, "$#{cost}"]).strip
      total_price += cost
      savings += item.savings(quantity)
    end

    puts
    puts "Total price: $#{total_price}"
    puts "You saved $#{savings} today!" if savings > 0
  end

  def self.item(name, &block)
    Docile.dsl_eval(ItemBuilder.new(name), &block)
      .build
      .tap { |item| @price_list[name] = item }
  end
end
