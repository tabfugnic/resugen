require 'spec_helper'

describe Education do
  
  let(:education) { mock_model Education }
  it { education.should be_valid }
  it { education.should be_a(Activity)}

end
