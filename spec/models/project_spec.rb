require 'spec_helper'

describe Project do
  
  let(:project) { mock_model Project }
  it { project.should be_valid }
  it { project.should be_a(Activity)}

end
