require 'rails_helper'

RSpec.describe "enterprises/new", type: :view do
  before(:each) do
    assign(:enterprise, Enterprise.new(
      :name => "MyString",
      :status => 1,
      :environments => nil,
      :services => nil
    ))
  end

  it "renders new enterprise form" do
    render

    assert_select "form[action=?][method=?]", enterprises_path, "post" do

      assert_select "input[name=?]", "enterprise[name]"

      assert_select "input[name=?]", "enterprise[status]"

      assert_select "input[name=?]", "enterprise[environments_id]"

      assert_select "input[name=?]", "enterprise[services_id]"
    end
  end
end
