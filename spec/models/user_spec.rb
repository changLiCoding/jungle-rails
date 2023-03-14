require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(e_mail: "test@example.com", first_name: "first name", last_name: "last name", password: "password", password_confirmation: "password")

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(user).to be_valid

    end
    it "is not valid without first_name" do
      user.first_name = nil
      expect(user).to_not be_valid

    end
    it "is not valid without last_name" do
      user.first_name = "first name"
      user.last_name = nil
      expect(user).to_not be_valid

    end
    it "is not valid without e_mail" do
      user.last_name = "last name"
      user.e_mail = nil

      expect(user).to_not be_valid
      expect(user.errors.full_messages[0]).to include("E mail can't be blank")
      expect(user.errors.full_messages[1]).to include("E mail is invalid")

    end

    it "is not valid with an invalid email format" do
      user.e_mail = "Invalid email string@a.c"
      expect(user).to_not be_valid
      expect(user.errors.full_messages[0]).to include("E mail is invalid")
    end

    it "is not valid without password" do
      user.e_mail = "test@example.com"
      user.password = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages[0]).to include("Password can't be blank")
      expect(user.errors.full_messages[1]).to include("Password is too short (minimum is 7 characters)")
      expect(user.errors.full_messages[2]).to include("Password can't be blank")

    end

    it "is not valid without password_confirmation" do
      user.password = "password"
      user.password_confirmation = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages[0]).to include("Password confirmation is too short (minimum is 7 characters)")
      expect(user.errors.full_messages[1]).to include("Password confirmation can't be blank")

    end

    it "is not valid with different password and password_confirmation" do
      user.password = "password"
      user.password_confirmation = "password1"
      expect(user).to_not be_valid
      expect(user.errors.full_messages[0]).to include("Password confirmation doesn't match Password")
    end

    it "is not valid with password or password_confirmation that less than 7 character" do
      user.password = "passwo"
      user.password_confirmation = "passwo"
      expect(user).to_not be_valid
      expect(user.errors.full_messages[0]).to include("Password is too short (minimum is 7 characters)")
      expect(user.errors.full_messages[1]).to include("Password confirmation is too short (minimum is 7 characters)")
    end

    it "is not valid with duplicated email address" do
      user.password_confirmation = "password"
      user.password = "password"
      user.save
      user_duplicated = User.new e_mail: "test@example.com", first_name: "first name", last_name: "last name", password: "password", password_confirmation: "password"
      expect(user_duplicated.valid?).to eql(false)
      expect(user_duplicated.errors.full_messages[0]).to include("E mail has already been taken")
    end


    it "is not valid with duplicated email address and case sensitive false" do
      user = User.new(e_mail: "test@example.com", first_name: "first name", last_name: "last name", password: "password", password_confirmation: "password")
      user.save
      user_duplicated = User.new e_mail: "TeSt@example.CoM", first_name: "first name", last_name: "last name", password: "password", password_confirmation: "password"
      expect(user_duplicated.valid?).to eql(false)
      expect(user_duplicated.errors.full_messages[0]).to include("E mail has already been taken")
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should authenticate with right email and password" do
      user = User.new(e_mail: "test@example.com", first_name: "first name", last_name: "last name", password: "password", password_confirmation: "password")
      user.save
      user_test = User.authenticate_with_credentials("test@example.com", "password")
      expect(user_test.e_mail).to eql("test@example.com")
    end

    it "should not authenticate with wrong password" do
      user = User.new(e_mail: "test@example.com", first_name: "first name", last_name: "last name", password: "password", password_confirmation: "password")
      user.save
      user_test = User.authenticate_with_credentials("test@example.com", "password1234")
      expect(user_test).to be_nil
    end

    it "should not authenticate with email that not exist" do

      user_test = User.authenticate_with_credentials("test@example.com", "password")
      expect(user_test).to be_nil
    end

    it "should authenticate with right email and password even though the email contain space" do
      user = User.new(e_mail: "test@example.com", first_name: "first name", last_name: "last name", password: "password", password_confirmation: "password")
      user.save
      user_test = User.authenticate_with_credentials("  test@example.com  ", "password")
      p user_test
      expect(user_test.e_mail).to eql("test@example.com")
    end


  end

end
