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
      get :show, {:id => activity.to_param}, valid_session
      assigns(:activity).should eq(activity)
    end
  end

  describe "GET new" do
    it "assigns a new activity as @activity" do
      get :new
      assigns(:activity).should be_a_new(Activity)
    end
  end

  describe "GET edit" do
    it "assigns the requested activity as @activity" do
      activity = FactoryGirl.create(:activity)
      get :edit, {:id => activity.to_param}, valid_session
      assigns(:activity).should eq(activity)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Activity" do
        expect {
          post :create, {:activity => valid_attributes}, valid_session
        }.to change(Activity, :count).by(1)
      end

      it "assigns a newly created activity as @activity" do
        post :create, {:activity => valid_attributes}, valid_session
        assigns(:activity).should be_a(Activity)
        assigns(:activity).should be_persisted
      end

      it "redirects to the created activity" do
        post :create, {:activity => valid_attributes}, valid_session
        response.should redirect_to(Activity.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activity as @activity" do
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        post :create, {:activity => {}}, valid_session
        assigns(:activity).should be_a_new(Activity)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        post :create, {:activity => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested activity" do
        activity = Activity.create! valid_attributes
        # Assuming there are no other activities in the database, this
        # specifies that the Activity created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Activity.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => activity.to_param, :activity => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested activity as @activity" do
        activity = Activity.create! valid_attributes
        put :update, {:id => activity.to_param, :activity => valid_attributes}, valid_session
        assigns(:activity).should eq(activity)
      end

      it "redirects to the activity" do
        activity = Activity.create! valid_attributes
        put :update, {:id => activity.to_param, :activity => valid_attributes}, valid_session
        response.should redirect_to(activity)
      end
    end

    describe "with invalid params" do
      it "assigns the activity as @activity" do
        activity = Activity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        put :update, {:id => activity.to_param, :activity => {}}, valid_session
        assigns(:activity).should eq(activity)
      end

      it "re-renders the 'edit' template" do
        activity = Activity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        put :update, {:id => activity.to_param, :activity => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested activity" do
      activity = Activity.create! valid_attributes
      expect {
        delete :destroy, {:id => activity.to_param}, valid_session
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = Activity.create! valid_attributes
      delete :destroy, {:id => activity.to_param}, valid_session
      response.should redirect_to(activities_url)
    end
  end

end
