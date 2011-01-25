#require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module UserSpecHelper
  def valid_user_attributes
    { :name => ""}
  end
end
describe "A User (in general)" do
  include UserSpecHelper
  before(:each) do
    @user = User.new
  end

  it "should be invalid without a username" do
    @user.attributes = valid_user_attributes.except(:name)
    @user.should_not be_valid
    @user.should have(2).error_on(:name)
    @user.errors.on(:name).should == ["can't be blank","is too short (minimum is 3 characters)"]
    @user.name = "so"
    @user.save
    @user.should have(1).error_on(:name)
    @user.errors.on(:name).should == "is too short (minimum is 3 characters)"
    @user.name = "somname"
    @user.save
    @user.should be_valid
  end

  
end