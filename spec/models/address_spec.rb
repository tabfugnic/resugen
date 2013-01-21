require 'spec_helper'

describe Address do

  let(:address) { mock_model Address }
  it { address.should be_valid }
  
  before(:each) {@address = FactoryGirl.create(:address)}

  it "is embedded in user" do
    @address.user.should be_valid
  end

end
