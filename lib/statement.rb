require './transaction'

class Statement
  def format(transaction_history)
    transaction_history.reverse_each do |transaction|
      print "  #{transaction[:date]} ||",
            " #{transaction[:credit]}  ||",
            " #{transaction[:debit]} ||",
            " #{transaction[:balance]}"
    end
  end

  def header
    ' Date      || Credit || Debit || Balance'
  end
end
