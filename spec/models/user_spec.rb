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

end
