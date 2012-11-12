require 'spec_helper'

describe "details/show" do
  before(:each) do
    @detail = assign(:detail, stub_model(Detail,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
