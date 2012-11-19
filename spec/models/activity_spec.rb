require 'spec_helper'

describe Activity do
  
  let(:activity) { mock_model Activity }
  it { activity.should be_valid }

  context "ending method" do
    before :each do
      @activity = FactoryGirl.build(:activity)
    end
    it "shows the normal end date when present" do
      @activity.end_date = (Date.today - 1).to_s
      @activity.ending.should == (Date.today - 1)
    end
    
    it "shows the end date as 'Present'" do
      @activity.end_date = nil
      @activity.ending.should == "Present"
      @activity.end_date = (Date.today + 1).to_s
      @activity.ending.should == "Present"
    end

  end
  
end
