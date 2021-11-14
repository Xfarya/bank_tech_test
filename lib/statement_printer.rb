class StatementPrinter
 
attr_reader :print_s

  def initialize(print_s)
    @print_s = print_s
  end

 def print_receipt
   print_statement
  end

private 

  def print_statement
    puts @transaction_table = ["date  ||  credit  ||  debit  ||  balance"]
    @table = @print_s.reverse.each do |d, c, deb, b|
    puts ["#{d} || #{c} ||  #{deb}  ||  #{b}"].join('\n')
    end
  end

end