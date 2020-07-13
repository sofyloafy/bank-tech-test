require 'spec_helper'
require_relative '../lib/transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  it 'should start with a balance of 0' do
    expect(Transaction::OPENING_BALANCE).to eq 0
  end

  xit 'should be able to withdraw' do
    transaction.balance = 0
    transaction.deposit(5)
    expect(transaction.balance).to eq 5
  end
end 