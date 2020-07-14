require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:account) { BankAccount.new(Transaction.new, Statement.new) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:desired_result){ " Date      || Credit || Debit || Balance \n  14/07/2020 || ------  || £500.00 || £2500.00  \n  14/07/2020 || £2000.00  || ------ || £3000.00  \n  14/07/2020 || £1000.00  || ------ || £1000.00  \n"}
  it 'should run a feature test' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect { account.print_statement }.to output(desired_result).to_stdout
  end
end