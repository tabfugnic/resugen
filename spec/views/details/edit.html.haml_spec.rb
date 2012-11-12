require 'spec_helper'

describe "details/edit" do
  before(:each) do
    @detail = assign(:detail, stub_model(Detail,
      :content => "MyString"
    ))
  end

  it "renders the edit detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => details_path(@detail), :method => "post" do
      assert_select "input#detail_content", :name => "detail[content]"
    end
  end
end
