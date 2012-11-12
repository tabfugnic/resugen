require 'spec_helper'

describe "details/index" do
  before(:each) do
    assign(:details, [
      stub_model(Detail,
        :content => "Content"
      ),
      stub_model(Detail,
        :content => "Content"
      )
    ])
  end

  it "renders a list of details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
