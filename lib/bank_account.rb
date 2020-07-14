require_relative './transaction'
require_relative './statement'

class BankAccount
  attr_reader :transaction, :statement

  def initialize(transaction= Transaction.new, statement = Statement.new)
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount)
    raise flag unless number(amount)

    transaction.deposit(amount)
  end

  def withdraw(amount)
    raise flag unless number(amount)

    transaction.withdraw(amount)
  end

  def print_statement
    statement.format(transaction.transaction_history)
    return nil
  end

  private
  def number(amount)
    amount.is_a? Integer
  end

  def flag
    'Please input a number'
  end
end
