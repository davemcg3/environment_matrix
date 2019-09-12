require 'rails_helper'

RSpec.describe "enterprises/edit", type: :view do
  before(:each) do
    @enterprise = assign(:enterprise, Enterprise.create!(
      :name => "MyString",
      :status => 1,
      :environments => nil,
      :services => nil
    ))
  end

  it "renders the edit enterprise form" do
    render

    assert_select "form[action=?][method=?]", enterprise_path(@enterprise), "post" do

      assert_select "input[name=?]", "enterprise[name]"

      assert_select "input[name=?]", "enterprise[status]"

      assert_select "input[name=?]", "enterprise[environments_id]"

      assert_select "input[name=?]", "enterprise[services_id]"
    end
  end
end
