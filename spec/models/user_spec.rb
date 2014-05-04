require 'spec_helper'

describe User do
  it "requires an email" do 
    user = FactoryGirl.build(:user, email: nil)
    expect{ user.save! }.to raise_error
  end
end
