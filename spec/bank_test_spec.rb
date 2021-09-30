# frozen_string_literal: true
require './bank_test'
require 'time'

describe Account do
  let(:account) { described_class.new('John') }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  context 'when new account is initialized' do
    it 'returns the users initial account balances' do
      expect(account.balance).to eq 0
      expect(account.credit).to eq 0
      expect(account.debit).to eq 0
    end

    it 'returns the date today' do
      expect(account.date).to eq date
    end
  end

  context 'when user makes a request' do

    it 'returns updated balance after deposit' do
      account.deposit(150.00)
      expect(account.balance).to eq 150.00
    end

    it 'returns updated balance after withdrawal' do
      account.deposit(400.00)
      account.withdraw(150.00)
      expect(account.balance).to eq 250.00
    end

    it 'should only return balance without any calculations' do
      account.deposit(300)
      expect(account.balance).to eq 300
    end
  end

  context 'printing a statement' do
    it 'prints a line of required fields' do
      account.deposit(300)
      account.withdraw(150)
      account.print_receipt
      expect(account.print).to eq [[date, 0, 300, 300.0], [date, 150, 0, 150.0]]
    end

    it 'should return transactions with latest first' do
      account.deposit(1000)
      account.print_receipt
      account.deposit(1000)
      account.print_receipt
      expect(account.print_receipt).to eq [[date, 0, 1000, 2000.0], [date, 0, 1000, 1000.0]]
    end
  end

  context 'possible edge cases' do
    it 'should allow for multiple deposits' do
      account.deposit(300)
      account.deposit(300)
      expect(account.balance).to eq 600
    end

    it 'should allow for multiple withdrawals' do
      account.deposit(1000)
      account.withdraw(300)
      account.withdraw(300)
      expect(account.balance).to eq 400
    end

    it 'should allow to check balance despite multiple requests' do
      account.deposit(1000)
      account.withdraw(300)
      account.balance
      account.withdraw(300)
      expect(account.balance).to eq 400
    end

    it 'should return a receipt for multiple transactions' do
      account.deposit(1000)
      account.print_receipt
      account.deposit(1000)
      account.print_receipt
      expect(account.print).to eq [[date, 0, 1000, 1000.0], [date, 0, 1000, 2000.0]]
    end

    it 'should empty deposit and withdrawal sums after transaction is printed' do
      account.deposit(1000)
      account.withdraw(1000)
      account.print_receipt
      expect(account.debit).to eq 0
    end

    it "should return an error if there is not enough money to withdraw" do
      expect{account.withdraw(150)}.to raise_error(RuntimeError, "Sorry, you do not have enough balance to withdraw at this time!")
    end

    # it "should return an error if no number if passed for deposit/withdrawal" do
    #    expect{account.withdraw("hello")}.to include "Sorry, you must enter a numerical value"
    # end

  end
end