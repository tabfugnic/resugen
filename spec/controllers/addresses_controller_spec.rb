require 'spec_helper'

describe AddressesController do

  describe "GET index" do
    it "assigns all addresses as @addresses" do
      address = Address.create! valid_attributes
      get :index, {}, valid_session
      assigns(:addresses).should eq([address])
    end
  end

  describe "GET show" do
    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      get :show, {:id => address.to_param}, valid_session
      assigns(:address).should eq(address)
    end
  end

  describe "GET new" do
    it "assigns a new address as @address" do
      get :new, {}, valid_session
      assigns(:address).should be_a_new(Address)
    end
  end

  describe "GET edit" do
    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      get :edit, {:id => address.to_param}, valid_session
      assigns(:address).should eq(address)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Address" do
        expect {
          post :create, {:address => valid_attributes}, valid_session
        }.to change(Address, :count).by(1)
      end

      it "assigns a newly created address as @address" do
        post :create, {:address => valid_attributes}, valid_session
        assigns(:address).should be_a(Address)
        assigns(:address).should be_persisted
      end

      it "redirects to the created address" do
        post :create, {:address => valid_attributes}, valid_session
        response.should redirect_to(Address.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved address as @address" do
        Address.any_instance.stub(:save).and_return(false)
        post :create, {:address => {}}, valid_session
        assigns(:address).should be_a_new(Address)
      end

      it "re-renders the 'new' template" do
        Address.any_instance.stub(:save).and_return(false)
        post :create, {:address => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested address" do
        address = Address.create! valid_attributes
        Address.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => address.to_param, :address => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested address as @address" do
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => valid_attributes}, valid_session
        assigns(:address).should eq(address)
      end

      it "redirects to the address" do
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => valid_attributes}, valid_session
        response.should redirect_to(address)
      end
    end

    describe "with invalid params" do
      it "assigns the address as @address" do
        address = Address.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Address.any_instance.stub(:save).and_return(false)
        put :update, {:id => address.to_param, :address => {}}, valid_session
        assigns(:address).should eq(address)
      end

      it "re-renders the 'edit' template" do
        address = Address.create! valid_attributes
        Address.any_instance.stub(:save).and_return(false)
        put :update, {:id => address.to_param, :address => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested address" do
      address = Address.create! valid_attributes
      expect {
        delete :destroy, {:id => address.to_param}, valid_session
      }.to change(Address, :count).by(-1)
    end

    it "redirects to the addresses list" do
      address = Address.create! valid_attributes
      delete :destroy, {:id => address.to_param}, valid_session
      response.should redirect_to(addresses_url)
    end
  end

end
