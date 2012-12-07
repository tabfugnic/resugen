require 'spec_helper'

describe DetailsController do
  before :each do
    controller.stub(:authenticate_user!).and_return(true)
  end
  describe "GET index" do
    before :each do
      @detail = FactoryGirl.create(:detail)
    end
    it "assigns all details as @details" do
      get :index, :activity_id => @detail.activity
      assigns(:details).to_a.should eq([detail])
    end
  end

  describe "GET show" do
    it "assigns the requested detail as @detail" do
      detail = Detail.create! valid_attributes
      get :show, {:id => detail.to_param}, valid_session
      assigns(:detail).should eq(detail)
    end
  end

  describe "GET new" do
    it "assigns a new detail as @detail" do
      get :new, {}, valid_session
      assigns(:detail).should be_a_new(Detail)
    end
  end

  describe "GET edit" do
    it "assigns the requested detail as @detail" do
      detail = Detail.create! valid_attributes
      get :edit, {:id => detail.to_param}, valid_session
      assigns(:detail).should eq(detail)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Detail" do
        expect {
          post :create, {:detail => valid_attributes}, valid_session
        }.to change(Detail, :count).by(1)
      end

      it "assigns a newly created detail as @detail" do
        post :create, {:detail => valid_attributes}, valid_session
        assigns(:detail).should be_a(Detail)
        assigns(:detail).should be_persisted
      end

      it "redirects to the created detail" do
        post :create, {:detail => valid_attributes}, valid_session
        response.should redirect_to(Detail.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved detail as @detail" do
        # Trigger the behavior that occurs when invalid params are submitted
        Detail.any_instance.stub(:save).and_return(false)
        post :create, {:detail => {}}, valid_session
        assigns(:detail).should be_a_new(Detail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Detail.any_instance.stub(:save).and_return(false)
        post :create, {:detail => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested detail" do
        detail = Detail.create! valid_attributes
        # Assuming there are no other details in the database, this
        # specifies that the Detail created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Detail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => detail.to_param, :detail => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested detail as @detail" do
        detail = Detail.create! valid_attributes
        put :update, {:id => detail.to_param, :detail => valid_attributes}, valid_session
        assigns(:detail).should eq(detail)
      end

      it "redirects to the detail" do
        detail = Detail.create! valid_attributes
        put :update, {:id => detail.to_param, :detail => valid_attributes}, valid_session
        response.should redirect_to(detail)
      end
    end

    describe "with invalid params" do
      it "assigns the detail as @detail" do
        detail = Detail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Detail.any_instance.stub(:save).and_return(false)
        put :update, {:id => detail.to_param, :detail => {}}, valid_session
        assigns(:detail).should eq(detail)
      end

      it "re-renders the 'edit' template" do
        detail = Detail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Detail.any_instance.stub(:save).and_return(false)
        put :update, {:id => detail.to_param, :detail => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested detail" do
      detail = Detail.create! valid_attributes
      expect {
        delete :destroy, {:id => detail.to_param}, valid_session
      }.to change(Detail, :count).by(-1)
    end

    it "redirects to the details list" do
      detail = Detail.create! valid_attributes
      delete :destroy, {:id => detail.to_param}, valid_session
      response.should redirect_to(details_url)
    end
  end

end
