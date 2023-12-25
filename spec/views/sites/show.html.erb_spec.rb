require 'rails_helper'

RSpec.describe "sites/show", type: :view do
  before(:each) do
    assign(:site, Site.create!(
      name: "Name",
      region: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
