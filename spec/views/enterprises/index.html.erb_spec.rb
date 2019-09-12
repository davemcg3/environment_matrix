require 'rails_helper'

RSpec.describe "enterprises/index", type: :view do
  before(:each) do
    assign(:enterprises, [
      Enterprise.create!(
        :name => "Name",
        :status => 2,
        :environments => nil,
        :services => nil
      ),
      Enterprise.create!(
        :name => "Name",
        :status => 2,
        :environments => nil,
        :services => nil
      )
    ])
  end

  it "renders a list of enterprises" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
