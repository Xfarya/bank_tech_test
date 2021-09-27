class Account

  attr_accessor :deposit_amount, :withdraw_amount, :date, :balance
  
  def initialize(name)
    @name = name
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
    @numb_of_calc = 0
    @numb_of_deposits = 0
    @deposit_amount = 0
  end

  def balance
    if @numb_of_calc >= @numb_of_deposits
      @balance
    else
      @numb_of_calc += 1
      calculate_balance
      @balance
    end
  end

  def deposit(deposit_amount)
    @numb_of_deposits += 1
    @deposit_amount += deposit_amount
  end 

  def withdraw(withdraw_amount)
    @withdraw_amount = withdraw_amount
  end 

  def transaction
    calculate_balance
    "#{@date} || #{@withdraw_amount} || #{@deposit_amount} || #{@balance}"
  end

  private

  def calculate_balance 
    @balance += @deposit_amount.to_f
    @balance -= @withdraw_amount.to_f
  end

end