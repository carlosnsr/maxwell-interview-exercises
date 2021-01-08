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

  FORMAT_STRING = "%-10s %-10s"
  FORMAT_STRING_LENGTH = 21

  def self.output(groceries)
    puts FORMAT_STRING % ['Item', 'Quantity']
    puts '-' * FORMAT_STRING_LENGTH
    groceries.each { |item, quantity| puts FORMAT_STRING % [item.capitalize, quantity] }
  end

  def self.item(name, &block)
    Docile.dsl_eval(ItemBuilder.new, &block).build(name).tap { |item| @price_list[name] = item }
  end
end
