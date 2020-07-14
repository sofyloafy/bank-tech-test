require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:account) { BankAccount.new(Transaction.new, Statement.new) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:desired_result){ " Date      || Credit || Debit || Balance \n  #{date} || ------  || £500.00 || £2500.00   #{date} || £2000.00  || ------ || £3000.00   #{date} || £1000.00  || ------ || £1000.00 "}
  
  it 'should run a feature test' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect { account.print_statement }.to output(desired_result).to_stdout
  end
end
