require './src/groceries/item'

module Groceries
  RSpec.describe "Item", "#cost" do
    subject { Item.new('Milk', 5.01).cost(4) }

    it 'the sum price' do
      expect(subject).to eql(Money.from_amount(20.04))
    end
  end

  RSpec.describe "Item", "#savings" do
    subject { Item.new('Milk', 5.01).savings(4) }

    it 'is always 0' do
      expect(subject).to eql(0)
    end
  end

  RSpec.describe "SaleItem", "#cost" do
    subject { SaleItem.new('Milk', 5.01, { quantity: 3, price: 12.00 }).cost(4) }

    it 'applies the savings for each multiple of the sale quantity' do
      expect(subject).to eql(Money.from_amount(17.01))
    end
  end

  RSpec.describe "SaleItem", "#savings" do
    subject { SaleItem.new('Milk', 5.01, { quantity: 3, price: 12.00 }).savings(4) }

    it 'applies the savings for each multiple of the sale quantity' do
      expect(subject).to eql(Money.from_amount(3.03))
    end
  end
end
