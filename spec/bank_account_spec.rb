require 'spec_helper'
require_relative '../lib/bank_account'

describe BankAccount do
  let(:bank_account) { BankAccount.new(Transaction.new, Statement.new) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:withdrawal_transaction) { [{ :balance => "£20.00", :credit => "£20.00", :date => date,
  :debit => "------" }, { :balance => "£15.00", :credit => "------", :date => date, :debit => "£5.00" }] 
  }

  it "should be initialized" do
    expect(bank_account.transaction.deposit(6)).to eq "You have deposited £6"
  end

  it "should reject deposit input unless an integer" do
    expect { bank_account.deposit('cat') }.to raise_error 'Please input a number'
  end

  it "should reject withdrawal input unless an integer" do
    expect { bank_account.withdraw('cat') }.to raise_error 'Please input a number'
  end

  it "should allow withdrawal of cash" do
    bank_account.deposit(20)
    expect(bank_account.withdraw(5)).to eq "You have withdrawn £5"

  end

  describe 'print_statement' do
    let(:format) do
      " Date      || Credit || Debit || Balance \n  #{date} || £5.00  || ------ || £5.00 "
    end

    let(:format_2) do
      " Date      || Credit || Debit || Balance \n  #{date} || £2.00  || ------ || £7.00   #{date} || £5.00  || ------ || £5.00 "
    end

    it "should print transactions in a user friendly-format" do
      bank_account.deposit(5)
      expect { bank_account.print_statement }.to output(format).to_stdout
    end

    it "should print the user-friendly statement in reverse order" do
      bank_account.deposit(5)
      bank_account.deposit(2)
      expect { bank_account.print_statement }.to output(format_2).to_stdout
    end
  end
end
