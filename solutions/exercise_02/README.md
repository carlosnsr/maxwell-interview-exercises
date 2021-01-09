# Groceries Calculator

This is the solution to [Exercise 2](../../exercise_02.md).

## Installation

```
gem install bundler
bundle install
```

## To Run

```
ruby price_calculator.rb
```

## Usage

There are two parts:
- input from the user
- defining a price list (i.e. what items cost, which are on sale, and their sale price and quantity.

### Price List

The price list contains all the data for an item.  It contains normal items and sale items.

Adding/updating items to/in the price list is done via the provided DSL.

```
# Adds/updates item 'detergent' with price $10.99 to/in the price list
item :detergent do
  price 10.99
end
```

```
# Adds/updates sale item 'cereal' with price $5.99
# and a sale price of 2 for $10.00 to/in the price list
item :cereal do
  price 5.99
  sale 2 for: 10.00
end
```

### Input from the user

When run, the script will prompt the user to enter in the items that they have purchased.
This input must be done on one line, with items separated by commas.

The items that the users entered will then be grouped by duplicates, and then
matched against the price list to get their prices.
The program will then output
- a summary of the items bought
- the cost for each grouping of the same item
- the total price owed
- the total saved by taking advantage of sale items

e.g.
```
$ ruby price_calculator.rb
Please enter all the items purchased separated by a comma
milk,milk, bread,banana,bread,bread,bread,milk,apple

Item     Quantity      Price
--------------------------------------
Milk      3            $8.97
Bread     4            $8.17
Apple     1            $0.89
Banana    1            $0.99

Total price : $19.02
You saved $3.45 today.
```
