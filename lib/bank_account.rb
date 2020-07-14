require_relative './transaction'
require_relative './statement'

class BankAccount
  attr_reader :transaction, :statement

  def initialize(transaction= Transaction.new, statement = Statement.new)
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount)
    raise 'Please input a number' unless amount.is_a? Integer

    transaction.deposit(amount)
  end

  def withdraw(amount)
    raise 'Please input a number' unless amount.is_a? Integer

    transaction.withdraw(amount)
  end

  def print_statement
    statement.format(transaction.transaction_history)
    return nil
  end
end
