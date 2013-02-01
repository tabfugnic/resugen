require 'spec_helper'

describe User do
  let(:user) { mock_model User }
  it { user.should be_valid }

  context "simple methods" do
    before :each do
      @user = FactoryGirl.build(:user)
    end
    it { @user.to_s.should == @user.email }
  end
  
  context "instance methods" do
    
    describe "#fullname" do
      subject { FactoryGirl.build(:user) }
      it "displays full name of user" do
        subject.fullname.should eq("#{subject.first_name} #{subject.last_name}")
      end
    end
    describe "#home_address" do
      before(:each) do
        @address1 = FactoryGirl.build(:address)
        @address2 = FactoryGirl.build(:address, :home => true)
      end
      subject { FactoryGirl.create(:user, :addresses => [ @address1, @address2 ]) }
      it "returns home address for user" do
        subject.home_address.should eq(@address2)
      end
    end
  end

end
