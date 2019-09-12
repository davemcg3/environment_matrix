require 'rails_helper'

RSpec.describe "enterprises/show", type: :view do
  before(:each) do
    @enterprise = assign(:enterprise, Enterprise.create!(
      :name => "Name",
      :status => 2,
      :environments => nil,
      :services => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
