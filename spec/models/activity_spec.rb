require 'spec_helper'

describe Activity do
  
  let(:activity) { mock_model Activity }
  it { activity.should be_valid }

  context "validate" do

    context "date" do
      before :each do
        @activity = FactoryGirl.build(:activity, :begin_date => 1.year.ago, :end_date => (Date.today + 5))
      end
      it { @activity.should be_valid }
      it "end date before start date is not valid" do
        @activity.end_date = 2.years.ago
        @activity.should_not be_valid
      end
      it "begin date is not in the future" do
        @activity.begin_date = Date.today + 1
        @activity.should_not be_valid
      end
    end
  end
  
  describe "#ending" do
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
  describe "#address" do
    before :each do
      @activity = FactoryGirl.create(:activity)
      @address = FactoryGirl.create(:address, :user => @activity.user)
    end
    it "saves a reference of address to the activity" do
      @activity.address = @address
      @activity.save
      @activity._address_id.should == @address._id
    end
    it "references address on user" do
      @activity._address_id = @address._id
      @activity.address.should == @address
    end
  end

end
