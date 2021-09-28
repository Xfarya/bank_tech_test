creating a bank balance receipt - where customer can print receipt to see balance.
the receipt should have 4 columns - date, credit, debit, balance
needs to interact with irb

when she deposits (the deposit column gets filled)
when she withdraws - the credit column gets filled
latest date should be at the top

edge cases

- floats
- not entering a number

user stories:

As a customer
So that I can see how much money I have
I would like the bank to give me a balance receipt

As a customer

Input/Output

account1 = Account.new("name")
account1.balance = £400
account1.can_print?(is_paper?) = true
account1.is_number(person1.add_money(200)) = true
account1.not_a_float(person1.withdraw_money(150)) = true
account1.add_money(200) = £600
account1.withdraw_money(150) = £450

Person

check_balance
add_money (can add floats)
withdraw_money (cannot withdraw floats)

Bank

is_money? (for withdrawal) (no floats)
can_print? (is paper?)
is_number? (cannot accept NaN)

TODO

make into columns
look at edge cases
refactor
