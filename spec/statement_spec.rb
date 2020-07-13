require_relative '../lib/statement'

describe Statement do
  let(:statement) { Statement.new }
  it 'should print a header' do
    expect(statement.header).to eq 'date || credit || debit || balance'
  end
end
