require 'date' # This allows the Date.today to work

class ATM # Creating blueprints for ATM
    attr_accessor :funds # Attribute, for IRB testing later...?!

    def initialize
        @funds = 1000
    end # Setting ATM preferences

    def withdraw(amount, pin_code, account) # Determines message sent to user depending on various scenarios
        case
        when insufficient_funds_in_account?(amount, account) 
            { status: false, message: 'insufficient funds', date: Date.today }
        when insufficient_funds_in_atm?(amount)
            {status: false, message: 'insufficient funds in ATM', date: Date.today }
        when incorrect_pin?(pin_code, account.pin_code)
            { status: false, message: 'wrong pin', date: Date.today }
        when card_expired?(account.exp_date)
            { status: false, message: 'card expired', date: Date.today }
        when account_disabled?(account.account_status)
            { status: false, message: 'account is disabled', date: Date.today }
        else
            preform_transaction(amount, account) 
        end    
    end

    def account_disabled?(account_status)
        account_status == :disabled # Can also work with account_status != :active, this method checks if the account is disabled/active
    end 

    private # Means that this info is only available to call from inside the class never outside

    def insufficient_funds_in_account?(amount, account)
        amount > account.balance # This method checks if the requested withdrawl amount is greater than account.balance
    end

    def preform_transaction(amount, account)
        @funds -= amount
        account.balance = account.balance - amount
        { status: true, message: 'success', date: Date.today, amount: amount } # Subtracts amount from both ATM fund and account balance + produces user message
    end

    private

    def insufficient_funds_in_atm?(amount)
        @funds < amount # This method checks if the requested amount is greater than the avaliable funds
    end

    private 

    def incorrect_pin?(pin_code, actual_pin)
        pin_code != actual_pin # This method compares inserted pin to account pin
    end

    def card_expired?(exp_date)
        Date.strptime(exp_date, '%m/%y') < Date.today # This method checks if the card expiration date has passed
    end


end