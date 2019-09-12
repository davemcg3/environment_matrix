require 'rails_helper'

RSpec.describe "environments/edit", type: :view do
  before(:each) do
    @environment = assign(:environment, Environment.create!(
      :name => "MyString",
      :status => 1,
      :project_id => nil
    ))
  end

  it "renders the edit environment form" do
    render

    assert_select "form[action=?][method=?]", environment_path(@environment), "post" do

      assert_select "input[name=?]", "environment[name]"

      assert_select "input[name=?]", "environment[status]"

      assert_select "input[name=?]", "environment[project_id_id]"
    end
  end
end
