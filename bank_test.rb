class Account

  attr_accessor :debit, :credit, :date, :balance, :print
  
  # creates new account, with name and statement data all set
  def initialize(new_account_name, balance = 0, date = Time.now.strftime("%d/%m/%Y"), deposit_amount = 0, withdraw_amount = 0)
    @name = new_account_name
    @date = date
    @credit = withdraw_amount
    @debit = deposit_amount
    @balance = balance
    puts "Hi #{@name}, your account was created!"
  # array to hold array of statement values
    @print = []
    @deposited = false
    @withdrawn = false
  # this is for updating the statment seperately everytime a new transaction is made
    @numb_of_transactions = 0
    @numb_of_requests = 0
  end

  def deposit(deposit_amount)
    # bringing value into instance variable
    @debit = deposit_amount
    # registering that amount has been deposited
    @deposited = true
    # keeping count of number of requests
    @numb_of_requests += 1 
    # calculate the sums
    calculate
    # value that is returned by calling this method
    @debit
  end 

  def withdraw(withdraw_amount)
    # bringing value into instance variable
    @credit = withdraw_amount
    # registering that amount has been credited
    @withdrawn = true
    # keeping count of number of requests
    @numb_of_requests += 1
    # calculate the sums
    calculate
    # value that is returned by calling this method
    @credit
  end 

  def print_receipt
    # will add values to statement array, and also clear deposit/withdraw pots
    commit_transaction
    # will output a table in the console
    puts @transaction_table = ["date  ||  credit  ||  debit  ||  balance"]
    @table = @print.reverse.each do |d, c, deb, b|
      puts ["#{d} || #{c} ||  #{deb}  ||  #{b}"].join('\n')
    end
  end

  private

  def calculate
    if @numb_of_transactions >= @numb_of_requests
      @balance
    else
      @numb_of_transactions += 1
      calculate_balance
      # @balance
    end
    @deposited = false
    @withdrawn = false
  end

  def calculate_balance 
    if @deposited == true
      @balance += @debit.to_f
    elsif @withdrawn == true && @balance > 0
      @balance -= @credit.to_f
    elsif @balance < 0
      puts "Sorry, you do not have enough balance to withdraw at this time!"
    end
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