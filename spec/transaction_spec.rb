require 'spec_helper'
require_relative '../lib/transaction'

describe Transaction do
  let(:transaction) { Transaction.new }
  let(:time) { Time.now.strftime("%d/%m/%Y") }

  it 'should start with a balance of 0' do
    expect(Transaction::OPENING_BALANCE).to eq 0
  end

  it 'should be able to deposit money' do
    expect(transaction.deposit(5)).to eq [{:balance=>"£5.00", :credit=>"£5.00", :date=> time, :debit=>"------"}]
  end

  it 'should be able to withdraw money' do
    transaction.deposit(6)
    expect(transaction.withdraw(5)[1]).to eq({:date=>"13/07/2020", :credit=>"------", :debit=>"£5.00", :balance=>"£1.00"})
  end

  it 'should prevent withdrawal if funds are insufficient' do
    expect { transaction.withdraw(5) }.to raise_error 'Your funds are insufficient'
  end

  it 'should add a deposit to transaction history' do
    expect(transaction.deposit_confirm(5)).to eq [{ :balance => "£0.00", :credit => "£5.00", :date => time, :debit => "------" }]
  end

  it 'should add a deposit to transaction history' do
    expect(transaction.withdraw_confirm(5)).to eq [{ :balance => "£0.00", :credit => 
    "------", :date => time, :debit => "£5.00" }]
  end

end
