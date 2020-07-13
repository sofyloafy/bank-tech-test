class Transaction
  attr_reader :transaction_history
  OPENING_BALANCE = 0

  def initialize
    @transaction_history = []
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    @balance += amount
    p @balance
  end

  def withdraw(amount)
    raise 'Your funds are insufficient' if @balance < amount
    @balance -= amount
    p @balance
  end
end
