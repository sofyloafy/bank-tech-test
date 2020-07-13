require 'spec_helper'
require_relative '../lib/transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  it 'should start with a balance of 0' do
    expect(Transaction::OPENING_BALANCE).to eq 0
  end

  it 'should be able to deposit money' do
    expect(transaction.deposit(5)).to eq 5
    transaction.deposit(6)
    expect(transaction.deposit(8)).to eq 19
  end

  it 'should be able to withdraw money' do
    transaction.deposit(6)
    expect(transaction.withdraw(5)).to eq 1
  end
end

