require 'spec_helper'

describe TemplatesController do
  
  before :each do
    controller.stub(:authenticate_user!).and_return(true)
  end
  describe "GET basic" do
    it "assigns nothing" do
      
    end
  end

end
