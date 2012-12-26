require 'spec_helper'

describe ActivitiesController do
  before :each do
    controller.stub(:authenticate_user!).and_return(true)
  end
  describe "GET index" do
    # Very generic
    it "assigns all activities as @activities" do
      activity = FactoryGirl.create(:activity)
      controller.stub(:current_user).and_return(activity.user)
      get :index
      assigns(:activities).to_a.should eq([activity])
    end
  end

  describe "GET show" do
    it "assigns the requested activity as @activity" do
      activity = FactoryGirl.create(:activity)
      controller.stub(:current_user).and_return(activity.user)
      get :show, {:id => activity.to_param}
      assigns(:activity).should eq(activity)
    end
  end

  describe "GET new" do
    it "assigns a new activity as @activity" do
      get :new, :type => [Employment, Project, Education].sample
      assigns(:activity).should be_a_new(Activity)
    end
  end

  describe "GET edit" do
    it "assigns the requested activity as @activity" do
      activity = FactoryGirl.create(:activity)
      controller.stub(:current_user).and_return(activity.user)
      get :edit, {:id => activity.to_param}
      assigns(:activity).should eq(activity)
    end
  end

  describe "POST create" do
    let(:type) { [Employment, Project, Education].sample }
    before :each do
      @user = FactoryGirl.create(:user)
      controller.stub(:current_user).and_return(@user)
    end

    describe "with valid params" do
      let(:valid_activity) { FactoryGirl.attributes_for(:activity) }
      it "creates a new Activity" do
        expect {
          post :create, {activity: valid_activity, type: type }
        }.to change(@user.activities, :count).by(1)
      end

      it "assigns a newly created activity as @activity" do
        post :create, { activity: valid_activity, type: type }
        assigns(:activity).should be_a(Activity)
        assigns(:activity).should be_persisted
      end

      it "redirects to the created activity" do
        post :create, { activity: valid_activity, type: type} 
        activity = @user.activities.last
        response.should redirect_to(activity)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activity as @activity" do
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        post :create, {activity: {}, type: type }
        assigns(:activity).should be_a_new(Activity)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        post :create, {activity: {}, type: type} 
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before :each do
      @activity = FactoryGirl.create(:activity)
      @user = @activity.user
      controller.stub(:current_user).and_return(@activity.user)
    end
    describe "with valid params" do
      let(:valid_activity) { FactoryGirl.attributes_for(:activity) }
      it "updates the requested activity" do
        Activity.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @activity.to_param, :activity => {'these' => 'params'}}
      end

      it "assigns the requested activity as @activity" do
        put :update, {:id => @activity.to_param, :activity => valid_activity}
        assigns(:activity).should eq(@activity)
      end

      it "redirects to the activity" do
        put :update, {:id => @activity.to_param, :activity => valid_activity}
        response.should redirect_to(@activity)
      end
    end

    describe "with invalid params" do
      it "assigns the activity as @activity" do
        Activity.any_instance.stub(:save).and_return(false)
        put :update, {:id => @activity.to_param, :activity => {}}
        assigns(:activity).should eq(@activity)
      end

      it "re-renders the 'edit' template" do
        Activity.any_instance.stub(:save).and_return(false)
        put :update, {:id => @activity.to_param, :activity => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @activity = FactoryGirl.create(:activity)
      @user = @activity.user
      controller.stub(:current_user).and_return(@user)
    end

    it "destroys the requested activity" do
      expect {
        delete :destroy, {:id => @activity.to_param} 
      }.to change(@user.activities, :count).by(-1)
    end

    it "redirects to the activities list" do
      delete :destroy, {:id => @activity.to_param}
      response.should redirect_to(activities_url)
    end
  end

end
