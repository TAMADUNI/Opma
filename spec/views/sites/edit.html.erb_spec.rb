require 'rails_helper'

RSpec.describe "sites/edit", type: :view do
  let(:site) {
    Site.create!(
      name: "MyString",
      region: nil
    )
  }

  before(:each) do
    assign(:site, site)
  end

  it "renders the edit site form" do
    render

    assert_select "form[action=?][method=?]", site_path(site), "post" do

      assert_select "input[name=?]", "site[name]"

      assert_select "input[name=?]", "site[region_id]"
    end
  end
end
