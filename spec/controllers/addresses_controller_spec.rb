require 'spec_helper'

describe AddressesController do
  let(:valid_address) { FactoryGirl.attributes_for(:address) }
  before(:each) do
    controller.stub(:authenticate_user!).and_return(true)
    @address = FactoryGirl.create(:address)
    controller.stub(:current_user).and_return(@address.user)
  end
  
  describe "GET index" do
    it "assigns all addresses as @addresses" do
      get :index
      assigns(:addresses).should eq([@address])
    end
  end

  describe "GET show" do
    it "assigns the requested address as @address" do
      get :show, {:id => @address.to_param}
      assigns(:address).should eq(@address)
    end
  end

  describe "GET new" do
    it "assigns a new address as @address" do
      get :new, {}
      assigns(:address).should be_a_new(Address)
    end
  end

  describe "GET edit" do
    it "assigns the requested address as @address" do
      get :edit, {:id => @address.to_param}
      assigns(:address).should eq(@address)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Address" do
        expect {
          post :create, {:address => valid_address}
        }.to change(Address, :count).by(1)
      end

      it "assigns a newly created @address as @@address" do
        post :create, {:address => valid_address}
        assigns(:address).should be_a(Address)
        assigns(:address).should be_persisted
      end

      it "redirects to the created @address" do
        post :create, {:address => valid_address}
        response.should redirect_to(Address.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved @address as @@address" do
        Address.any_instance.stub(:save).and_return(false)
        post :create, {:address => {}}
        assigns(:address).should be_a_new(Address)
      end

      it "re-renders the 'new' template" do
        Address.any_instance.stub(:save).and_return(false)
        post :create, {:address => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested @address" do
        Address.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @address.to_param, :address => {'these' => 'params'}}
      end

      it "assigns the requested address as @address" do
        put :update, {:id => @address.to_param, :address => valid_address}
        assigns(:address).should eq(@address)
      end

      it "redirects to the @address" do
        put :update, {:id => @address.to_param, :address => valid_address}
        response.should redirect_to(@address)
      end
    end

    describe "with invalid params" do
      it "assigns the address as @address" do
        Address.any_instance.stub(:save).and_return(false)
        put :update, {:id => @address.to_param, :address => {}}
        assigns(:address).should eq(@address)
      end

      it "re-renders the 'edit' template" do
        Address.any_instance.stub(:save).and_return(false)
        put :update, {:id => @address.to_param, :address => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested @address" do
      expect {
        delete :destroy, {:id => @address.to_param}
      }.to change(Address, :count).by(-1)
    end

    it "redirects to the @addresses list" do
      delete :destroy, {:id => @address.to_param}
      response.should redirect_to(@addresses_url)
    end
  end

end
