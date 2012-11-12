require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :country => "MyString",
      :state => "MyString",
      :zip_code => 1
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path, :method => "post" do
      assert_select "input#address_address1", :name => "address[address1]"
      assert_select "input#address_address2", :name => "address[address2]"
      assert_select "input#address_city", :name => "address[city]"
      assert_select "input#address_country", :name => "address[country]"
      assert_select "input#address_state", :name => "address[state]"
      assert_select "input#address_zip_code", :name => "address[zip_code]"
    end
  end
end
