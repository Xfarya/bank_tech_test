require "./bank_test.rb"
require 'time'

describe Account do
  let(:account) { described_class.new("John") }

  it "returns the users account balance" do
    expect(account.balance).to eq 0
  end

  it "returns the users deposit amount" do
    expect(account.deposit(150)).to eq 150.00
  end

  it "returns the users withdrawal amount" do
    expect(account.withdraw(150)).to eq 150.00
  end

  it "returns the date today" do
    date = Time.now.strftime("%d/%m/%Y")
    expect(account.date).to eq date
  end

  it "returns updated balance after deposit" do
    account.deposit(150.00)
    expect(account.balance).to eq 150.00
  end

  it "returns updated balance after withdrawal" do
    account.deposit(400.00)
    account.withdraw(150.00)
    expect(account.balance).to eq 250.00
  end

  it "prints a line of required fields" do
    account.deposit(300)
    account.withdraw(150)
    expect(account.transaction).to eq "27/09/2021 || 150 || 300 || 150.0"
  end
end