require_relative './transaction'

class Statement
  def format(transaction_history)
    print header
    transaction_history.reverse_each do |transaction|
      print "  #{transaction[:date]} ||",
            " #{transaction[:credit]}  ||",
            " #{transaction[:debit]} ||",
            " #{transaction[:balance]}  \n"
    end
  end

  def header
    " Date      || Credit || Debit || Balance \n"
  end
end
