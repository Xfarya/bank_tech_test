class Account

  attr_reader :debit, :credit, :date, :balance, :print

  def initialize(name)
    @name = name
    puts "Hi #{@name}, your account was created!"
    initialize_variables
  end

  def deposit(deposit_amount)
    deposit_amount.to_f
    check_num(deposit_amount)
    deposited
    @debit = deposit_amount
    calculate_balance
    deposit_amount.to_f
  end 

  def withdraw(withdraw_amount)
    withdrawn
    @credit = withdraw_amount
    calculate_balance
    withdraw_amount.to_f
  end 

  def print_receipt
   print_statement
  end

  private

  def initialize_variables
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = 0
    @debit = 0
    @balance = 0
    @print = []
    @deposited = false
    @withdrawn = false
  end
  
  def deposited
    @deposited = true
  end

  def withdrawn
    @withdrawn = true
  end

   def commit_transaction
    @print << [ @date, @credit, @debit, @balance ]
    clear_transaction_data
  end

  def print_statement
    puts @transaction_table = ["date  ||  credit  ||  debit  ||  balance"]
    @table = @print.reverse.each do |d, c, deb, b|
    puts ["#{d} || #{c} ||  #{deb}  ||  #{b}"].join('\n')
    end
  end

  def calculate_balance 
    if @deposited == true
      @balance += @debit.to_f
      commit_transaction
    elsif @withdrawn == true && @balance >= @credit
      @balance -= @credit.to_f
      commit_transaction
    elsif @balance <= @credit
      raise "Sorry, you do not have enough balance to withdraw at this time!"
      clear_transaction_data
    end
    clear_data
  end

  def clear_data
    @deposited = false
    @withdrawn = false
  end

  def clear_transaction_data
    @debit = 0
    @credit = 0
  end

end