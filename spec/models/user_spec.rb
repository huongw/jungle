require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a valid user' do
      @user = User.create(
      first_name: "John", 
      last_name: "Smith", 
      email: "js34@mail.com", 
      password: "1234", 
      password_confirmation: "1234"
      )
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
  end
  
    it 'should not create a valid password' do
      @user = User.create(
      first_name: "John", 
      last_name: "Smith", 
      email: "js34@mail.com", 
      password: "1234", 
      password_confirmation: "12345"
      )
      expect(@user.password).to_not be_equal(@user.password_confirmation)
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
  end

    it 'should not create a valid user without password' do
      @user = User.create(
      first_name: "John", 
      last_name: "Smith", 
      email: "js34@mail.com", 
      password: nil, 
      password_confirmation: "12345"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password can't be blank"
  end

    it 'should have a password with a minimum length of 3' do
      @user = User.create(
      first_name: "John", 
      last_name: "Smith", 
      email: "js34@mail.com", 
      password: "12", 
      password_confirmation: "12"
      )

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
      expect(@user.errors.full_messages).to include "Password confirmation is too short (minimum is 3 characters)"
  end

    it 'should not create a valid user without password confirmation' do
      @user = User.create(
      first_name: "John", 
      last_name: "Smith", 
      email: "js34@mail.com", 
      password: "1234", 
      password_confirmation: nil
      )

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
  end

    it 'should not create a valid user without first name, last name, and email' do
      @user = User.create(
      first_name: nil, 
      last_name: nil, 
      email: nil, 
      password: "1234", 
      password_confirmation: "1234"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
  end

    it 'should not create a valid user for user2' do
      @user = User.create(
      first_name: "John", 
      last_name: "Smith", 
      email: "js34@mail.com", 
      password: "1234", 
      password_confirmation: "1234"
      )

      @user2 = User.create(
      first_name: "John", 
      last_name: "Smith", 
      email: "JS34@mail.com", 
      password: "1234", 
      password_confirmation: "1234"
      )

      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
  end
  end

  describe '.authenticate_with_credentials' do
    it 'should not be nil even with spaces are in email address' do
      User.create(
        first_name: "Sam",
        last_name: "Smith",
        email: "example@domain.com",
        password: "1234",
        password_confirmation: "1234"
      )

      @user = User.authenticate_with_credentials(" example@domain.com ", "1234")

      expect(@user).to_not be_nil
    end

    it 'should not be nil even with wrong cases in email address' do
      User.create(
        first_name: "Sam",
        last_name: "Smith",
        email: "example@domain.com",
        password: "1234",
        password_confirmation: "1234"
      )

      @user = User.authenticate_with_credentials("EXAMPLE@domain.com", "1234")

      expect(@user).to_not be_nil
    end
  end
end
