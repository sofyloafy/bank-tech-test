require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:bank_account) { BankAccount.new }
  it 'should allow user to have a bank account' do
    expect(bank_account).to eq
  end
end
