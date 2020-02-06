require 'date' # This allows the Date.today to work

class Account # Creating blueprints for the User Account
    attr_accessor :pin_code, :balance, :account_status, :exp_date, :owner

    STANDARD_VALIDITY_YRS = 5 # Setting card expiration to five years after issue

    def initialize (attrs = {})
        @exp_date = set_expire_date()
        @pin_code = rand(1000..9999)
        @account_status = :active
        set_owner(attrs[:owner])
        @balance = 0
       
    end # Setting a random pincode

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
      end

      def deactivate
        @account_status = :deactivated
      end 

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end
end




# TO DO'S

# Initialize account status
# Generate random pin

# Set expiration date
# Set pin
# Create instance double
# Checking lenghts of pin



