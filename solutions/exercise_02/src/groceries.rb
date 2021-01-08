module Groceries
  def self.parse(input)
    Hash.new(0).tap do |list|
      input.split(',').each { |item| list[item.strip.to_sym] += 1 }
    end
  end
end
