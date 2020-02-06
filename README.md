# ATM Challenge
Code pairing: *Kayla Woodbury*, *Karolina Frostare*

## Code overview
This software creates a digital ATM using Ruby and RSpec testing.The goal is to simulate an actual ATM where:

* ATM must have funds for user to make a withdrawal
* User should receive message if withdrawal was successful or unsuccessful
* Each person can only withdraw from their own account
* Withdrawals can only be made if sufficient funds are available
* Each account will have a unique pin code
* Each account must be active
* Bills distributed in the denominations of $5, $10 and $20
* In order to withdraw or deposit users must access their account

## Dependencies

* Ruby
* Gems: Rspec, Pry-ByeBug

## Setup
To access this code visit [GitHub](https://github.com/kfrostare/atm_challenge_2019) repo and complete the following steps:

1. Fork the repo and clone
2. Have Ruby and Gem bundler installed
3. Utilize IRB to run program

## Instructions
Instructions for running in IRB.

**Activate virtual ATM** | atm = ATM.new 

**Create virtual person** | person = Person.new(name: *your_name*)

**Create personal account** | account = Account.new(owner: *your_name*) Generates an account with number, expiration date, pin code, account status, owner and balance. 

**Deposit funds into account** | person.deposit(*desired_amount*)

**Withdraw funds** | person.withdraw(amount: *desired_amount*, pin: *)
