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
