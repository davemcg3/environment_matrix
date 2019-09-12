require 'rails_helper'

RSpec.describe "environments/show", type: :view do
  before(:each) do
    @environment = assign(:environment, Environment.create!(
      :name => "Name",
      :status => 2,
      :project_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
