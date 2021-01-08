require './src/groceries'

module Groceries
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
