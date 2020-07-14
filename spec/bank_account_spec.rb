require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:transaction) { Transaction.new }
  let(:statement) { Statement.new }
  let(:bank_account) { BankAccount.new(transaction, statement) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:withdrawal_transaction) { [{ :balance => "£20.00", :credit => "£20.00", :date => date,
  :debit => "------" }, { :balance => "£15.00", :credit => "------", :date => date, :debit => "£5.00" }] 
  }

  it "should be initialized" do
    expect(bank_account.transaction.deposit(6)).to eq [{ :balance => "£6.00", :credit => "£6.00", :date => date, :debit => "------" }]
  end

  it "should reject deposit input unless an integer" do
    expect { bank_account.deposit('cat') }.to raise_error 'Please input a number'
  end

  it "should reject withdrawal input unless an integer" do
    expect { bank_account.withdraw('cat') }.to raise_error 'Please input a number'
  end

  it "should allow withdrawal of cash" do
    bank_account.deposit(20)
    expect(bank_account.withdraw(5)).to eq withdrawal_transaction
  end

  it "should print transactions in a user friendly-format" do
    bank_account.deposit(20)
    expect(bank_account.print_statement).to eq  [{:balance=>"£20.00",
    :credit=>"£20.00",
    :date=>"14/07/2020",
    :debit=>"------"}]
  end
end
