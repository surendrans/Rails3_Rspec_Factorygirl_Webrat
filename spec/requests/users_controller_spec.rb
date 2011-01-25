require 'spec_helper'
describe "user index page" do
  before :all do
    User.delete_all
    @user = User.create(:name=>"suren")
    get users_path
    user = Factory.create(:user)
  end

  it "should be success" do
    response.should be_success
  end
  
  it "should contain an item" do
    response.should have_selector("td", :content =>@user.name )
  end
  
end