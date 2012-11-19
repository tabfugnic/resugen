require 'spec_helper'

describe Detail do
  let(:detail) { mock_model Detail }
  it { detail.should be_valid }
end
