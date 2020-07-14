require_relative './transaction'
require_relative './statement'

class BankAccount
  attr_reader :transaction, :statement

  def initialize(transaction, statement)
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount)
    raise 'Please input a number' if amount != Integer

    transaction.deposit(amount)
  end

  def withdraw(amount)
    transaction.withdraw(amount)
  end

  def print_statement
    statement.format(transaction.transaction_history)
  end
end
