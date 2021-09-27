require "./bank_test.rb"

describe Account do
  let(:account) { described_class.new("John") }

  it "returns the users account balance" do
    expect(account.balance).to eq 400.00
  end

  it "returns the users deposit amount" do
    expect(account.deposit(150)).to eq 150.00
  end

  it "returns the users withdrawal amount" do
    expect(account.withdraw(150)).to eq 150.00
  end

end