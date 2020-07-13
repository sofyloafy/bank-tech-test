class Transaction
  attr_reader :transaction_history
  OPENING_BALANCE = 0

  def initialize
    @transaction_history = []
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Your funds are insufficient' if @balance < amount
    
    @balance -= amount
  end


  def deposit_confirm(amount)
    transaction = {
      date: Time.now.strftime("%d/%m/%Y"),
      credit: sprintf("£%2.2f", amount),
      debit: '------',
      balance: sprintf("£%2.2f", @balance)
    }
    transaction_history.push(transaction)
  end
end
