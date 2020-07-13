require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:bank_account) { BankAccount.new(transactions, statement) }
  let(:transactions) { double('transactions') }
  let(:statement) { double('statement') }
end
