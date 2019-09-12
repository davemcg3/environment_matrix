require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email",
        :role => "Role",
        :api_key => "Api Key"
      ),
      User.create!(
        :name => "Name",
        :email => "Email",
        :role => "Role",
        :api_key => "Api Key"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Api Key".to_s, :count => 2
  end
end
