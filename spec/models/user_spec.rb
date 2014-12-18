require 'rails_helper'

describe User do

  describe '#save' do

  context 'given a password' do
    let(:user) { User.new } 

    before do
      user.password = 'my_password'
    end

    it 'can be created' do
      expect(user.save).to eq true
    end
  end

  context 'without a password' do
    let(:user) { User.new } 

    it 'cannot be created' do
      expect(user.save).to eq false
    end
  end
  end

  describe '.employed' do
    context 'given some employed users' do

      before do
        organization = Organization.create(name: 'General Assembly')

        3.times do
          User.create(password: 'password1')
        end

        user = User.all.sample

        user.organization = organization

        user.save!
      end
 
      it 'returns a array of employed users' do
        puts User.employed.count
        puts Organization
        expect(User.employed.count).to eq 1
      end
    end

  end
end