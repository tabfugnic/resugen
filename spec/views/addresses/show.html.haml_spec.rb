require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :country => "Country",
      :state => "State",
      :zip_code => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address1/)
    rendered.should match(/Address2/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(/State/)
    rendered.should match(/1/)
  end
end
