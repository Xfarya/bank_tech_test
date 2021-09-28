class Account

  attr_accessor :debit, :credit, :date, :balance, :print
  
  def initialize(new_account_name, balance = 0, date = Time.now.strftime("%d/%m/%Y"), deposit_amount = 0, withdraw_amount = 0)
    @name = new_account_name
    puts "Hi #{@name}, your account was created!"
    @date = date
    @credit = withdraw_amount
    @debit = deposit_amount
    @balance = balance
    @deposited = false
    @withdrawn = false
    @print = []

    @numb_of_calc = 0
   
    @numb_of_transactions = 0
    
    
  end

  def calculate
    if @numb_of_calc >= @numb_of_transactions
      @balance
    else
      @numb_of_calc += 1
      calculate_balance
      @balance
    end

    @deposited = false
    @withdrawn = false
  end

  def deposit(deposit_amount)
    @deposited = true
    @numb_of_transactions += 1 
    @debit = deposit_amount
    calculate
    @debit
  end 

  def withdraw(withdraw_amount)
    @withdrawn = true
    @numb_of_transactions += 1
    @credit = withdraw_amount
    calculate
    @credit
  end 

  def transaction
    # @print << Receipt.new(@date, @withdraw_amount, @deposit_amount, @balance)
    @print << [ @date, @credit, @debit, @balance ]
    clear_transaction
  end

  def print_receipt
    puts @transaction = ["date  ||  credit  ||  debit  ||  balance"]
    @table = @print.each do |d, c, deb, b|
      puts ["#{d} || #{c} ||  #{deb}  ||  #{b}"].join('\n')
    end
  end

  private

  def calculate_balance 
    if @deposited == true
      @balance += @debit.to_f
    elsif @withdrawn == true
      @balance -= @credit.to_f
    end
  end

  def clear_transaction
    @debit = 0
    @credit = 0
  end

  


end