require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:transaction) { Transaction.new }
  let(:statement) { Statement.new }
  let(:bank_account) { BankAccount.new(transaction, statement) }

  it "should be initialized" do
    expect(bank_account.transaction.deposit(6)).to eq [{:balance=>"£6.00", :credit=>"£6.00", :date=>"14/07/2020", :debit=>"------"}]
  end

  it "should reject anything but an integer" do
    expect{ bank_account.deposit('cat') }.to raise_error 'Please input a number'
  end
end
