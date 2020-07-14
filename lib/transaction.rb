class Transaction
  attr_reader :transaction_history
  OPENING_BALANCE = 0

  def initialize
    @transaction_history = []
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    @balance += amount
    deposit_confirm(amount)
    "You have deposited £#{amount}"
  end

  def withdraw(amount)
    raise 'Your funds are insufficient' if @balance < amount

    @balance -= amount
    withdraw_confirm(amount)
    "You have withdrawn £#{amount}"
  end

  def deposit_confirm(amount)
    transaction = {
      date: Time.now.strftime('%d/%m/%Y'),
      credit: format('£%<amount>.2f', amount: amount),
      debit: '------',
      balance: format('£%<balance>.2f', balance: @balance)
    }
    transaction_history.push(transaction)
  end

  def withdraw_confirm(amount)
    transaction = {
      date: Time.now.strftime('%d/%m/%Y'),
      credit: '------',
      debit: format('£%<amount>.2f', amount: amount),
      balance: format('£%<balance>.2f', balance: @balance)
    }
    transaction_history.push(transaction)
  end
end
