require './lib/account.rb'
# require './lib/atm.rb' 
require 'date'

describe Account do # Testing Account class
    # let(:account) { instance_double()}

    # before do
    #     allow(account).to receive(:balance).and_return(100)
    #     allow(account).to receive(:balance=)
    #     # allow(account).to recieve(:pin_code).and_return(rand(1000..9999)) # Include random pin generation
    # end 

    it 'check the length of a number' do
        number = rand(1000..9999) # or 1234...
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
    end # Checking if the pin has four digits

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end # Testing account has expiration date w. default five years

end
