require './src/groceries'

def main
  puts "Please enter all the items purchased separated by a comma"
  input = gets
  groceries = Groceries.parse(input)

  puts
  Groceries.output(groceries)
end

main
