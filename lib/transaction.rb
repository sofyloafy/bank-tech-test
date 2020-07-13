class Transaction
  OPENING_BALANCE = 0

  def initialize
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    @balance += amount
    p @balance
  end
end
