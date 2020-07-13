require_relative './transaction'

class Statement
  def format(transaction_history)
    p header
    transaction_history.each do |transaction|
      print "  #{transaction[:date]} ||",
            " #{transaction[:credit]}  ||",
            " #{transaction[:debit]} ||",
            " #{transaction[:balance]}  \n"
    end
  end

  def header
    ' Date      || Credit || Debit || Balance'
  end
end
