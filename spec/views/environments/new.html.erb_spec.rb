require 'rails_helper'

RSpec.describe "environments/new", type: :view do
  before(:each) do
    assign(:environment, Environment.new(
      :name => "MyString",
      :status => 1,
      :project_id => nil
    ))
  end

  it "renders new environment form" do
    render

    assert_select "form[action=?][method=?]", environments_path, "post" do

      assert_select "input[name=?]", "environment[name]"

      assert_select "input[name=?]", "environment[status]"

      assert_select "input[name=?]", "environment[project_id_id]"
    end
  end
end
