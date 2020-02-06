require './lib/account.rb'

class Person # Creating blueprints for the Person that uses the account
    attr_accessor :account,  :name, :cash

    def initialize (attrs = {})
        @cash = 0
        set_name(attrs[:name]) # Looks to the attribute to set the name of the person
        @account == nil
    end

    def create_account
        @account = Account.new(owner: self)
    end

    def deposit(amount)
        @account == nil ? missing_account : deposit_funds(amount)
    end

    def withdraw(args = {})
        @account == nil ? missing_account : withdraw_funds(args)
    end

    def withdraw_funds(args)
        args[:atm] == nil ? missing_atm : args[:atm] = ATM
        amount = args[:amount]
        pin = @account.pin_code
        account = @account
        @cash += args[:amount]
        @account.balance -= args[:amount]
    end

    def missing_atm # 
        raise 'An ATM is required'
    end

    private # Private methods are dependent on other events in order to initialize

    def deposit_funds(amount)
        @cash -= amount
        @account.balance += amount
      end 

    def set_name(obj) # Declaring the attribute "name" as an object and setting it as name
        obj == nil ? missing_name : @name = obj
    end

    def missing_name # Sending message if name is missing
        raise 'A person name is required'
    end

    def set_owner(obj) # Declaring the attribute "owner" as object
        obj = @owner = @name
    end

    def missing_account # 
        raise RuntimeError, 'No account present'
    end

end 