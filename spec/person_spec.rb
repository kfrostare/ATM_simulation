require './lib/person.rb' # This makes it possible for the tests to gather class info
require './lib/atm.rb' # This makes it possible for the tests to gather class info

describe Person do 
    subject { described_class.new(name: 'Thomas')} # Establishing new instance with Thomas as the account holder/person

    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end # Testing that there is a name (Thomas) present

    it 'is expected to raise an error if no name is set' do
        expect { described_class.new }.to raise_error 'A name is required'
    end # Testing that there is an error message when name is missing

    it 'is expected to have a :cash attribute with the value of 0 on initialize' do
        expect(subject.account).to be nil    
    end # Checking to see that the account is empty

    it 'is expected to haver a :account attribute' do
        expect(subject.account).to be nil
    end # Checking for account attribute to exist, maybe try boolean instead of nil

    describe 'can create an Account' do
        before { subject.create_account } # Trying to generate an instance of an account class with Thomas as the owner
        it 'of Account class ' do
            expect(subject.account).to be_an_instance_of Account
        end
        it 'with himself as owner' do
            expect(subject.account.owner).to be subject
        end
    end

    describe 'can manage funds if an account has been created' do # Testing if program can connect to Atm class to interact with balance and deposit
        let(:atm) { Atm.new }
        before { subject.create_account }
        it 'can deposit funds' do
            expect(subject.deposit(100)).to be_truthy
        end

        describe 'can not manage funds if no account has been created' do # Making sure an error occurs if the user doesn't have an account
            it 'can\'t deposit funds' do
                expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
            end
        end

    end

end