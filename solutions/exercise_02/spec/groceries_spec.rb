require './src/groceries'

RSpec.describe Groceries, "#parse" do
  subject { Groceries.parse(input) }

  context 'given a comma separated list' do
    let(:input) { 'milk,milk,butter' }

    it 'returns a list of purchased items' do
      expect(subject).to eql({
        milk: 2,
        butter: 1
      })
    end
  end

  context 'given a comma separated list with whitespaces' do
    let(:input) { 'milk , milk, butter ' }

    it 'ignores the whitespace' do
      expect(subject).to eql({
        milk: 2,
        butter: 1
      })
    end
  end
end

RSpec.describe Groceries, "#output" do
  subject { Groceries.output(groceries) }

  context 'given a list of groceries and their quantities' do
    let(:groceries) { { milk: 2, butter: 1 } }

    it 'returns a list of purchased items' do
      expect { subject }.to output(
        <<~OUTPUT
          Item       Quantity  
          ---------------------
          Milk       2         
          Butter     1         
        OUTPUT
      ).to_stdout
    end
  end
end

RSpec.describe Groceries, "#price_list" do
  subject { Groceries.price_list }

  it 'starts with an empty price_list' do
    expect(subject).to be_empty
  end
end

RSpec.describe Groceries, "#item" do
  before(:each) { Groceries.reset_price_list }

  context 'when creating an item' do
    subject { Groceries.item :milk do price 4.00 end }

    it 'returns a Grocery Item with the name and price' do
      item = subject
      expect(item).to be_a(Groceries::Item)
      expect(item.name).to eql('Milk')
      expect(item.price).to eql(4.00)
    end

    it 'adds a milk grocery item to the price_list' do
      expect { subject }.to change { Groceries.price_list.size }.by(1)
      expect(Groceries.price_list[:milk]).not_to be_nil
      expect(Groceries.price_list[:milk]).to be_a(Groceries::Item)
    end
  end

  context 'when creating an item that is on sale' do
    subject do
      Groceries.item :milk do
        price 4.00
        sale 2, for: 6.00
      end
    end

    it 'returns a Grocery Sale Item with a name, price, and sale price' do
      item = subject
      expect(item).to be_a(Groceries::Item)
      expect(item.name).to eql('Milk')
      expect(item.price).to eql(4.00)
      expect(item.sale).to eql({ quantity: 2, for: 6.00 })
    end

    it 'adds a milk grocery item to the price_list' do
      expect { subject }.to change { Groceries.price_list.size }.by(1)
      expect(Groceries.price_list[:milk]).not_to be_nil
      expect(Groceries.price_list[:milk]).to be_a(Groceries::SaleItem)
    end
  end
end
