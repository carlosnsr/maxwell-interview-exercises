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
