require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:bank_account) { BankAccount.new(transaction, statement) }
  let(:transaction) { double('transaction') }
  let(:statement) { double('statement') }

  it "should be initialized" do
    allow(bank_account.transaction.deposit(6))
    expect(bank_account.transaction.deposit(6)).to eq 6
  end

  it "should reject anything but an integer" do
    expect{ bank_account.deposit('cat') }.to raise_error 'Please input a number'
  end
end
