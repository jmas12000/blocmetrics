require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "user sign up" do
    
    let(:test_user) { FactoryGirl.create(:user) }

    it "should save a unique user to the database" do
      expect(test_user).to be_valid
    end

    it "should not save user to the database if email already exists" do
      expect(FactoryGirl.build(:user, email: test_user.email)).to_not be_valid
    end

    it "should not save user to the database if email is invalid" do
      expect(FactoryGirl.build(:user, email: "invalid")).to_not be_valid
    end
  
  end

end
