require 'spec_helper'

describe "activities/show" do
  before(:each) do
    @activity = assign(:activity, FactoryGirl.create(:activity))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    rendered.should match(/Title/)
    rendered.should match(/Summary/)
  end
end
