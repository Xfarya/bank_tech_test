class Account

  attr_accessor :deposit_amount, :withdraw_amount
  
  def initialize(name)
    @name = name
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def balance 
    @balance += @deposit_amount.to_f
    @balance -= @withdraw_amount.to_f
  end

  def deposit(deposit_amount)
    @deposit_amount = deposit_amount
  end 

  def withdraw(withdraw_amount)
    @withdraw_amount = withdraw_amount
  end 

  def date
    "27/09/2021"
  end

  def transaction
    balance
    "#{@date} || #{@withdraw_amount} || #{@deposit_amount} || #{@balance}"
  end

end