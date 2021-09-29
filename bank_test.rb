class Account

  attr_accessor :debit, :credit, :date, :balance, :print

  def initialize(name)
    @name = name
    puts "Hi #{@name}, your account was created!"
    initialize_helpers
  end

  def deposit(deposit_amount)
    deposited
    @debit = deposit_amount
    # requests
    calculate_balance
    deposit_amount
  end 

  def withdraw(withdraw_amount)
    withdrawn
    @credit = withdraw_amount
    # requests
    calculate_balance
    withdraw_amount
  end 

  def print_receipt
   print_statement
  end

  private

  def initialize_helpers
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = 0
    @debit = 0
    @balance = 0
    @print = []
    @deposited = false
    @withdrawn = false
    # @numb_of_transactions = 0
    # @numb_of_requests = 0
  end

  # def requests
  #   @numb_of_requests += 1 
  # end

  def deposited
    @deposited = true
  end

  def withdrawn
    @withdrawn = true
  end

  def print_statement
    puts @transaction_table = ["date  ||  credit  ||  debit  ||  balance"]
    @table = @print.reverse.each do |d, c, deb, b|
    puts ["#{d} || #{c} ||  #{deb}  ||  #{b}"].join('\n')
    end
  end
  
  # def calculate
  #   if @numb_of_transactions >= @numb_of_requests
  #     @balance
  #   else
  #     @numb_of_transactions += 1
  #     calculate_balance
  #   end
  #   clear_data
  # end

  def clear_data
    @deposited = false
    @withdrawn = false
  end

  def calculate_balance 
    if @deposited == true
      @balance += @debit.to_f
      commit_transaction
    elsif @withdrawn == true && @balance >= @credit
      @balance -= @credit.to_f
      commit_transaction
    elsif @balance <= @credit
      puts "Sorry, you do not have enough balance to withdraw at this time!"
      @credit = 0
    end
    clear_data
  end

  def commit_transaction
    @print << [ @date, @credit, @debit, @balance ]
    clear_transaction_data
  end

  def clear_transaction_data
    @debit = 0
    @credit = 0
  end

end