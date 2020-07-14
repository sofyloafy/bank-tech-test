require_relative '../lib/statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:transaction_history) { [{ :balance => "£5.00", :credit => "£5.00", :date => date, :debit => "------" }] }

  it 'should print a header' do
    expect(statement.header).to eq " Date      || Credit || Debit || Balance \n"
  end

  describe '#format' do
    let(:format) do
      " Date      || Credit || Debit || Balance \n  14/07/2020 || £5.00  || ------ || £5.00 "
    end

    it 'should print a transaction history' do
      expect { statement.format(transaction_history) }.to output(format).to_stdout
    end
  end
end
