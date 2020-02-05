require './lib/account.rb'
require './lib/atm.rb' 
require 'date'

describe Account do # Testing Account class
    let(:person) { instance_double('Person', name: 'Thomas')} #Creating fake person to test on
    subject { described_class.new({owner: person}) } #Connecting person as the owner for the account
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

    it 'is expected to have :active status on initialize' do
        expect(subject.account_status).to eq :active
    end #Testing that account is active on initialization

    it 'deactivates account using the instance method' do
        subject.deactivate
        expect(subject.account_status).to eq :deactivated
      end #Testing that account is deactivated
    
    it 'is expected to thave an owner' do
        expect(subject.owner).to eq person
    end #Testing to make sure there is an account owner

    it 'is expected to raise error if no owner is set' do
        expect { described_class.new }.to raise_error 'An Account owner is required'
    end #Testing to make sure there is a flag if an account is not linked to a person/owner
end
