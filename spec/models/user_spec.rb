require 'spec_helper'

describe User do
  let(:user) { mock_model User }
  it { user.should be_valid }
  
  it { user.to_s.should == user.email }
end
