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

**Activate virtual ATM** | Generates an ATM ID and the funds value in the ATM 

        atm = ATM.new


**Create virtual person** | Generates a person ID, cash value and name

        person = Person.new(name: *your_name*)


**Create personal account** | Generates an account ID, expiration date, pin code, account status, owner and balance.
        
        account = Account.new(owner: *your_name*) 


**Deposit funds into account** | Adds entered amount to account balance, and subtracts from user's cash amount

        person.deposit(*desired_amount*)

**Withdraw funds** | Subtracts entered amount from account balance and from ATM funds

        person.withdraw(amount: *desired_amount*, pin: *generated_pin*, account: *generated_account_id*, atm: *generated_atm_id*)

**Notes**

Trying to withdraw funds without the ATM ID will result in

        An ATM is required

Trying to withdraw funds without the generated account ID will result in 

        No account present

## Acknowledgements
Material from [Craft Academy](learn.craftacademy.co) <br>
[Ruby Documentation](rubymonstas.org) <br>
[Rspec Program](rspec.info) <br>
Material from the [Craftoverflow](https://github.com/CraftAcademy/CraftOverflow) repo on GitHub

## Updates/Improvement Plans
Yet to be determined.

## License
MIT License