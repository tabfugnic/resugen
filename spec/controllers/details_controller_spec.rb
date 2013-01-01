require 'spec_helper'

describe DetailsController do
  before :each do
    controller.stub(:authenticate_user!).and_return(true)
  end
  describe "#activity" do
    it "assigns activity" do
      detail = FactoryGirl.create :detail
      controller.stub(:current_user).and_return detail.activity.user
      controller.stub(:params).and_return( { :activity_id => detail.activity.id } )
      controller.send(:activity).should == detail.activity
    end
  end
  describe "GET index" do
    it "assigns all details as @details" do
      detail = FactoryGirl.create(:detail)
      controller.stub(:activity).and_return(detail.activity)
      get :index
      assigns(:details).to_a.should eq([detail])
    end
  end

  describe "GET show" do
    it "assigns the requested detail as @detail" do
      pending "Show method isn't actually used"
      detail = FactoryGirl.create(:detail)
      controller.stub(:current_user).and_return(detail.activity.user)
      get :show, {:activity_id => detail.activity, :id => detail}
      assigns(:detail).should eq(detail)
    end
  end

  describe "GET new" do
    it "assigns a new detail as @detail" do
      detail = FactoryGirl.create(:detail)
      get :new
      assigns(:detail).should be_a_new(Detail)
    end
  end

  describe "GET edit" do
    it "assigns the requested detail as @detail" do
      detail = FactoryGirl.create(:detail)
      controller.stub(:activity).and_return(detail.activity)
      get :edit, { :id => detail }
      assigns(:detail).should eq(detail)
    end
  end

  describe "POST create" do
    before :each do
      @activity = FactoryGirl.create(:activity)
      @detail_attributes = FactoryGirl.attributes_for(:detail)
      controller.stub(:activity).and_return @activity
    end
    describe "with valid params" do
      it "creates a new Detail" do
        expect {
          post :create, {:detail => @detail_attributes }
        }.to change(@activity.details, :count).by(1)
      end

      it "assigns a newly created detail as @detail" do
        post :create, {:detail => @detail_attributes }
        assigns(:detail).should be_a(Detail)
        assigns(:detail).should be_persisted
      end

      it "redirects to the created detail" do
        post :create, {:detail => @detail_attributes}
        response.should redirect_to(@activity.details.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved detail as @detail" do
        Detail.any_instance.stub(:save).and_return(false)
        post :create, {:detail => {}}
        assigns(:detail).should be_a_new(Detail)
      end

      it "re-renders the 'new' template" do
        Detail.any_instance.stub(:save).and_return(false)
        post :create, {:detail => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before :each do
      @detail = FactoryGirl.create(:detail)
      controller.stub(:activity).and_return @detail.activity
    end
    describe "with valid params" do
      it "updates the requested detail" do
        Detail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @detail.to_param, :detail => {'these' => 'params'}}
      end

      it "assigns the requested detail as @detail" do
        put :update, {:id => @detail.to_param, :detail => FactoryGirl.attributes_for(:detail)}
        assigns(:detail).should eq(@detail)
      end

      it "redirects to the detail" do
        put :update, {:id => @detail.to_param, :detail => FactoryGirl.attributes_for(:detail)}
        response.should redirect_to(@detail)
      end
    end

    describe "with invalid params" do
      it "assigns the detail as @detail" do
        Detail.any_instance.stub(:save).and_return(false)
        put :update, {:id => @detail.to_param, :detail => {}}
        assigns(:detail).should eq(@detail)
      end

      it "re-renders the 'edit' template" do
        Detail.any_instance.stub(:save).and_return(false)
        put :update, {:id => @detail.to_param, :detail => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @detail = FactoryGirl.create(:detail)
      @activity = @detail.activity
      controller.stub(:activity).and_return @activity
    end
    it "destroys the requested detail" do
      expect {
        delete :destroy, {:id => @detail.to_param }
      }.to change(@activity.details, :count).by(-1)
    end

    it "redirects to the details list" do
      delete :destroy, {:id => @detail.to_param}
      response.should redirect_to(details_url)
    end
  end

end
