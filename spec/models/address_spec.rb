require 'spec_helper'

describe Address do

  let(:address) { mock_model Address }
  it { address.should be_valid }

end
