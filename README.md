How to run tests:

bundle install

How to run:

irb
require "./bank_test.rb"
create new account - e.g. account_1 = Account.new("John")
Deposit cash - e.g. account_1.deposit(100)
Withdraw cash - e.g. account_1.withdraw(50.5)
Print receipt of recent transactoins - e.g. account_1.print_receipt

Approach - tried to keep it as simple as people
Structure - placed main methods in public, and inner workings for methods in private

User stories:

As an account holder
So that I may be able to save my money
I would like to be able to make deposits to my account
(account.deposit)

As an account holder
So that I may be able to access my money
I would like to be able to make withdrawals from my account
(account.withdraw)

As an account holder
So that I may be able to see a list of my most recent transactions
I would like to be able to print a a dated statement
(account.print_receipt)

---

+----------+--------------+-------+--------+---------+
| Object - | Methods |  
+----------+--------------+-------+--------+---------+
| Person - | ------- |
+----------+--------------+-------+--------+---------+
| Account |create account| deposit | withdraw | display
+----------+--------------+-------+--------+---------+

---

Edge cases + improvements

- if there is 0 in balance, then account holder will not be allowed to withdraw -_could*improve*_- could set a default capacity
- floating numbers so that users can input pence also -_*could_improve*_- standardise the display to 2 decimal points
- -_*could_improve*_- couldn't get this to work for floats - but if more time, then look at cases with no number, if deposit amount is not a number, to raise an error
- -_*could_improve*_- make it more user friendly - perhaps using 'gets.chomp()' methods, where user can interact with program and answer questions - perhaps this is not so customer friendly at the moment.
- -_*could_improve*_- could add limit of previous transactions (perhaps previous 5)
- need to get better at exception handling
