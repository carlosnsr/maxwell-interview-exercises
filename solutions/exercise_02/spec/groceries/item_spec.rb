require './src/groceries/item'

module Groceries
  RSpec.describe 'Item' do
    let(:item) { Item.new('Milk', 5.01) }

    describe '#cost' do
      subject { item.cost(4) }

      it 'returns the sum price' do
        expect(subject).to eql(Money.from_amount(20.04))
      end
    end

    describe 'Item', '#savings' do
      subject { item.savings(4) }

      it 'is always 0' do
        expect(subject).to eql(0)
      end
    end
  end

  RSpec.describe 'SaleItem', '#cost' do
    let(:item) { SaleItem.new('Milk', 5.01, { quantity: 3, price: 12.00 }) }

    describe '#cost' do
      subject { item.cost(4) }

      it 'applies the savings for each multiple of the sale quantity' do
        expect(subject).to eql(Money.from_amount(17.01))
      end
    end

    describe 'SaleItem', '#savings' do
      subject { item.savings(4) }

      it 'returns the amount saved over the flat cost' do
        expect(subject).to eql(Money.from_amount(3.03))
      end
    end
  end
end
