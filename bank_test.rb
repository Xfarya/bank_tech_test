class Account

  attr_accessor :deposit_amount, :withdraw_amount, :date, :balance
  
  def initialize(name)
    @name = name
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
    @numb_of_calc = 0
    @deposit_amount = 0
    @withdraw_amount = 0
    @numb_of_transactions = 0
    @deposited = false
    @withdrawn = false
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
    @deposit_amount = deposit_amount
    calculate
    @deposit_amount
  end 

  def withdraw(withdraw_amount)
    @withdrawn = true
    @numb_of_transactions += 1
    @withdraw_amount = withdraw_amount
    calculate
    @withdraw_amount
  end 

  def transaction
    calculate_balance
    "#{@date} || #{@withdraw_amount} || #{@deposit_amount} || #{@balance}"
  end

  private

  def calculate_balance 
    if @deposited == true
      @balance += @deposit_amount.to_f
    elsif @withdrawn == true
      @balance -= @withdraw_amount.to_f
    end
  end

end