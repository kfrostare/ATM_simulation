require 'date' # This allows the Date.today to work

class Account # Creating blueprints for the User Account
    attr_accessor :pin_code, :balance, :account_status, :exp_date

    STANDARD_VALIDITY_YRS = 5 # Setting card expiration to five years after issue

    def Initialize (attrs = {})
        @exp_date = set_expire_date
        @pin_code = rand(1000..9999)
       
    end # Setting a random pincode

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%Y')
    end

end




# TO DO'S

# Initialize account status
# Generate random pin

# Set expiration date
# Set pin
# Create instance double
# Checking lenghts of pin



