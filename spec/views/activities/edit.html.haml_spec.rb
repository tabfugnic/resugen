require 'spec_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, FactoryGirl.create(:activity))
  end

  it "renders the edit activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activities_path(@activity), :method => "post" do
      assert_select "input#activity_name", :name => "activity[name]"
      assert_select "input#activity_title", :name => "activity[title]"
      assert_select "input#activity_summary", :name => "activity[summary]"
    end
  end
end
