require 'spec_helper'

describe Employment do
  
  let(:employment) { mock_model Employment }
  it { employment.should be_valid }
  it { employment.should be_a(Activity)}

end
