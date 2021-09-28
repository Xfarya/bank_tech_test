require './bank_test.rb'
require 'time'

describe Account do
  let(:account) { described_class.new("John") }

  it "returns the users initial account balances" do
    expect(account.balance).to eq 0
    expect(account.credit).to eq 0
    expect(account.debit).to eq 0
  end

  it "returns the date today" do
    date = Time.now.strftime("%d/%m/%Y")
    expect(account.date).to eq date
  end

  it "returns the users deposit amount" do
    expect(account.deposit(150)).to eq 150.00
  end

  it "returns the users withdrawal amount" do
    expect(account.withdraw(150)).to eq 150.00
  end

  it "returns updated balance after deposit" do
    account.deposit(150.00)
    expect(account.balance).to eq 150.00
  end

  it "returns updated balance after withdrawal" do
    account.deposit(400.00)
    # p account.balance
    account.withdraw(150.00)
    # p account.balance
    expect(account.balance).to eq 250.00
  end

  it "prints a line of required fields" do
    account.deposit(300)
    account.withdraw(150)
    account.print_receipt
    expect(account.print).to eq [["28/09/2021", 150, 300, 150.0]]
  end

  it "should only return balance without any calculations" do
    account.deposit(300)
    expect(account.balance).to eq 300
  end

  it "should allow for multiple deposits" do
    account.deposit(300)
    account.deposit(300)
    expect(account.balance).to eq 600
  end

  it "should allow for multiple withdrawals" do
    account.deposit(1000)
    account.withdraw(300)
    account.withdraw(300)
    expect(account.balance).to eq 400
  end

  it "should allow to check balance despite multiple requests" do
    account.deposit(1000)
    account.withdraw(300)
    account.balance
    account.withdraw(300)
    expect(account.balance).to eq 400
  end

  it "should return a receipt for multiple transactions" do
    account.deposit(1000)
    account.print_receipt
    account.deposit(1000)
    account.print_receipt
    # p account.transaction
    expect(account.print).to eq [["28/09/2021", 0, 1000, 1000.0], ["28/09/2021", 0, 1000, 2000.0]]
  end

  it "should return transactions with latest first" do
    account.deposit(1000)
    account.print_receipt
    account.deposit(1000)
    account.print_receipt
    expect(account.print_receipt).to eq [["28/09/2021", 0, 0, 2000.0], ["28/09/2021", 0, 1000, 2000.0], ["28/09/2021", 0, 1000, 1000.0]]
  end


  it "should empty deposit and withdrawal sums after transaction is printed" do
    account.deposit(1000)
    account.withdraw(1000)
    account.print_receipt
    expect(account.debit).to eq 0
  end
end