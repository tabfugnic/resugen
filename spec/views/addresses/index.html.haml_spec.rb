require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :country => "Country",
        :state => "State",
        :zip_code => 1
      ),
      stub_model(Address,
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :country => "Country",
        :state => "State",
        :zip_code => 1
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
