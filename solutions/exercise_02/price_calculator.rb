require './src/groceries'

module Groceries
  item :milk do
    price 3.97
    sale 2, for: 5.00
  end
  item :bread do
    price 2.17
    sale 3, for: 6.00
  end
  item :banana do price 0.99 end
  item :apple do price 0.89 end
end

def main
  puts "Please enter all the items purchased separated by a comma"
  input = gets
  groceries = Groceries.parse(input)

  puts
  Groceries.output(groceries)
end

main
