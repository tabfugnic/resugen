require 'spec_helper'

describe "details/new" do
  before(:each) do
    assign(:detail, stub_model(Detail,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => details_path, :method => "post" do
      assert_select "input#detail_content", :name => "detail[content]"
    end
  end
end
